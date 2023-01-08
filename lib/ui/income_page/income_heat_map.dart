// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../data/model/heat_map_model.dart';
import '../../enum/currency_value.dart';
import '../../generated/l10n.dart';
import '../../util/constants.dart';
import '../../util/text_formatter.dart';
import '../common/add_portfolio_dialog_design.dart';
import '../common/base_show_dialog.dart';
import '../common/notification_toast.dart';
import '../global/stock_data_manager.dart';
import '../global/stock_data_state.dart';
import '../top_page/top_page_state.dart';
import 'heat_map_struct/heat_map_struct.dart';

class IncomeHeatMap extends StatelessWidget {
  const IncomeHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    final portfoio = context.select((StockDataState value) => value.portfolio);
    final colorTheme = context.select((TopPageState value) => value.colorTheme);
    return Visibility(
      visible: portfoio.isNotEmpty,
      replacement: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Text(S.of(context).noData),
        ),
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 100,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: heatMapStruct(
          models: portfoio,
          colorIndex: colorTheme,
        )
            .map(
              (model) => StaggeredGridTile.count(
                crossAxisCellCount: model.crossAxisSize,
                mainAxisCellCount: model.mainAxisSize,
                child: _HeatMapElement(heatMapModel: model),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _HeatMapElement extends StatelessWidget {
  const _HeatMapElement({required this.heatMapModel});

  final HeatMapModel heatMapModel;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<StockDataManager>();
    final income = context.select((TopPageState value) {
      if (value.currencyValue == CurrencyValue.usd) {
        return r'$ ' + '${formatter.format(heatMapModel.model.incomeUsd.floor())}';
      } else {
        return '¥ ${formatter.format(heatMapModel.model.incomeJpy.floor())}';
      }
    });
    return Card(
      color: heatMapModel.color,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () async {
          await _checkAndAddPortfolio(
            context: context,
            model: heatMapModel.model,
            viewModel: viewModel,
          );
        },
        onLongPress: () async {
          await _deletePortfolio(
            context: context,
            model: heatMapModel.model,
            viewModel: viewModel,
          );
        },
        child: Center(
          child: Text(
            '${heatMapModel.model.ticker} \n$income',
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: kFontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Future<void> _checkAndAddPortfolio({
    required BuildContext context,
    required GsheetsModel model,
    required StockDataManager viewModel,
  }) async {
    void inputMethod(int stocks) => viewModel.inputNumverOfStock(stocks);
    final formKey = GlobalKey<FormState>();
    final intlMessage = S.of(context);
    final isAdded = await baseShowDialog(
      context: context,
      title: S.of(context).checkAdding,
      formKey: formKey,
      widget: MultiProvider(
        providers: [
          Provider.value(value: inputMethod),
          Provider.value(value: formKey),
        ],
        child: AddPortfolioDialogDesign(model),
      ),
    );
    if (isAdded ?? false) {
      viewModel.addPortfolio(model);
      await NotificationToast.showToast(
        context: context,
        message: intlMessage.completeAddition,
      );
    }
  }

  Future<void> _deletePortfolio({
    required BuildContext context,
    required GsheetsModel model,
    required StockDataManager viewModel,
  }) async {
    final intlMessage = S.of(context);
    final isDelete = await baseShowDialog(
      context: context,
      title: S.of(context).checkDelete,
      isSimpleDialog: true,
      widget: Padding(
        padding: const EdgeInsets.only(top: kPadding / 2),
        child: Text(S.of(context).checkCannotUndone),
      ),
    );
    if (isDelete ?? false) {
      viewModel.deletePortfolio(model);
      await NotificationToast.showToast(
        context: context,
        message: intlMessage.completeDelete,
      );
    }
  }
}
