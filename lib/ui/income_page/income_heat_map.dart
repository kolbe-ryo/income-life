import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:income_life/data/model/heat_map_model.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:income_life/ui/income_page/heat_map_struct/heat_map_struct.dart';
import 'package:income_life/ui/income_page/income_page_state.dart';
import 'package:provider/provider.dart';

class IncomeHeatMap extends StatelessWidget {
  const IncomeHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    final sortedGsheets = context.select((IncomePageState value) => value.sortedGsheets);
    return StaggeredGrid.count(
      crossAxisCount: 100,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: heatMapStruct(sortedGsheets)
          .map(
            (model) => StaggeredGridTile.count(
              crossAxisCellCount: model.crossAxisSize,
              mainAxisCellCount: model.mainAxisSize,
              child: _HeatMapElement(model: model),
            ),
          )
          .toList(),
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
