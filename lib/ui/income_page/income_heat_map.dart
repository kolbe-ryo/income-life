// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../data/model/heat_map_model.dart';
import '../../enum/color_index_enum.dart';
import '../../util/constants.dart';
import '../common/add_portfolio_dialog_design.dart';
import '../common/base_show_dialog.dart';
import '../global/stock_data_manager.dart';
import '../global/stock_data_state.dart';
import 'heat_map_struct/heat_map_struct.dart';

class IncomeHeatMap extends StatelessWidget {
  const IncomeHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    final portfoio = context.select((StockDataState value) => value.portfolio);
    return Visibility(
      visible: portfoio.isNotEmpty,
      replacement: const AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Text('No Data'),
        ),
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 100,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: heatMapStruct(
          models: portfoio,
          colorIndex: ColorIndexEnum.crash,
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
            heatMapModel.model.ticker,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: kFontSize,
              fontWeight: FontWeight.bold,
            ),
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
    final isAdded = await baseShowDialog(
      context: context,
      title: 'Add Your Portfolio?',
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
    }
  }

  Future<void> _deletePortfolio({
    required BuildContext context,
    required GsheetsModel model,
    required StockDataManager viewModel,
  }) async {
    final isDelete = await baseShowDialog(
      context: context,
      title: 'Do you want to delete?',
      isSimpleDialog: true,
      widget: const Padding(
        padding: EdgeInsets.only(top: kPadding / 2),
        child: Text('This operation cannot be undon.'),
      ),
    );
    if (isDelete ?? false) {
      viewModel.deletePortfolio(model);
    }
  }
}
