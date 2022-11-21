import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:income_life/data/model/gsheets_model.dart';
import 'package:income_life/ui/common/app_colors.dart';
import 'package:income_life/ui/common/constants.dart';
import 'package:income_life/ui/global/stock_data_state.dart';
import 'package:provider/provider.dart';

class IncomeHeatMap extends StatelessWidget {
  const IncomeHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaWidth = context.select((MediaQueryData value) => value.size.width);
    return StaggeredGrid.count(
      crossAxisCount: 100,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 50,
          mainAxisCellCount: 50,
          child: _HeatMapElement(Colors.red),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 20,
          mainAxisCellCount: 20,
          child: _HeatMapElement(Colors.white),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 30,
          mainAxisCellCount: 30,
          child: _HeatMapElement(Colors.teal),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 20,
          mainAxisCellCount: 30,
          child: _HeatMapElement(Colors.black38),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 30,
          mainAxisCellCount: 20,
          child: _HeatMapElement(Colors.orange),
        ),
      ],
    );
  }
}

class _HeatMapElement extends StatelessWidget {
  const _HeatMapElement(this.backgroundColor);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // final modelList = context.select((StockDataState value) => value.gsheets.map((elem) => ));
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Text('test'),
        ),
      ),
    );
  }
}
