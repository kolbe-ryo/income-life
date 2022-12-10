// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:income_life/data/model/gsheets_model.dart';
import 'package:income_life/ui/common/base_show_dialog.dart';
import 'package:income_life/ui/common/custom_text_field.dart';
import 'package:income_life/ui/global/stock_data_manager.dart';
import 'package:income_life/util/logger.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../data/model/heat_map_model.dart';
import '../common/constants.dart';
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
          await checkMyStock(context, heatMapModel.model);
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

  Future<void> checkMyStock(BuildContext context, GsheetsModel model) async {
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
        child: Padding(
          padding: const EdgeInsets.only(top: kPadding / 2, left: kPadding),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: kFontSize),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Ticker :'),
                    Expanded(
                      child: Text(
                        model.ticker,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kPadding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('Stocks :'),
                    Expanded(
                      child: DigitsTextField(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (isAdded ?? false) {
      viewModel.addPortfolio(model);
    }
  }
}
