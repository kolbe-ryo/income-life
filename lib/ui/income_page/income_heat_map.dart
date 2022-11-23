import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:income_life/data/model/heat_map_model.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:income_life/ui/global/stock_data_state.dart';
import 'package:income_life/ui/income_page/heat_map_struct/heat_map_struct.dart';
import 'package:provider/provider.dart';

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
                child: _HeatMapElement(model: model),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _HeatMapElement extends StatelessWidget {
  const _HeatMapElement({required this.model});

  final HeatMapModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: model.color,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Text(
            model.model.ticker,
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
}
