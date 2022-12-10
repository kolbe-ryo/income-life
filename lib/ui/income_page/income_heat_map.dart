// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../data/model/heat_map_model.dart';
import '../../util/logger.dart';
import '../common/add_portfolio_dialog_design.dart';
import '../common/base_show_dialog.dart';
import '../common/constants.dart';
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
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: heatMapStruct(portfoio)
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
    return Card(
      color: heatMapModel.color,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () async {
          await _checkAndAddPortfolio(context, heatMapModel.model);
          logger.info('onPress');
        },
        onLongPress: () {
          logger.info('onLongPress');
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

  Future<void> _checkAndAddPortfolio(
    BuildContext context,
    GsheetsModel model,
  ) async {
    final viewModel = context.read<StockDataManager>();
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

  Future<void> _deletePortfolio() async {}
}
