// Project imports:
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:income_life/generated/l10n.dart';

import '../../../data/model/gsheets_model.dart';
import '../../../data/model/heat_map_model.dart';
import '../../../enum/color_index_enum.dart';

List<HeatMapModel> heatMapStruct({
  required List<GsheetsModel> models,
  required ColorIndexEnum colorIndex,
}) {
  int getSizeRate(
    double selfAmount,
    double pairAmount,
  ) =>
      (100 * selfAmount / pairAmount).floor();

  final _context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;

  switch (models.length) {
    case 1:
      return [
        HeatMapModel(
          mainAxisSize: 100,
          crossAxisSize: 100,
          color: colorIndex.colors[0],
          model: models[0],
        ),
      ];

    case 2:
      final pairAmount0 = models[0].incomeUsd + models[1].incomeUsd;
      final size0 = getSizeRate(models[0].incomeUsd, pairAmount0);
      final size1 = getSizeRate(models[1].incomeUsd, pairAmount0);
      return [
        HeatMapModel(
          mainAxisSize: 100,
          crossAxisSize: size0,
          color: colorIndex.colors[0],
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: 100,
          crossAxisSize: size1,
          color: colorIndex.colors[1],
          model: models[1],
        ),
      ];

    case 3:
      final pairAmount0 = models[0].incomeUsd + models[1].incomeUsd;
      final pairAmount1 = models[1].incomeUsd + models[2].incomeUsd;
      final size0 = getSizeRate(models[0].incomeUsd, pairAmount0);
      final size1 = getSizeRate(models[1].incomeUsd, pairAmount0);
      final size2 = getSizeRate(models[1].incomeUsd, pairAmount1);
      final size3 = getSizeRate(models[2].incomeUsd, pairAmount1);
      return [
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size0,
          color: colorIndex.colors[0],
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size1,
          color: colorIndex.colors[1],
          model: models[1],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: 100,
          color: colorIndex.colors[2],
          model: models[2],
        ),
      ];

    case 4:
      final pairAmount0 = models[0].incomeUsd + models[1].incomeUsd;
      final pairAmount1 = models[1].incomeUsd + models[2].incomeUsd;
      final pairAmount2 = models[2].incomeUsd + models[3].incomeUsd;
      final size0 = getSizeRate(models[0].incomeUsd, pairAmount0);
      final size1 = getSizeRate(models[1].incomeUsd, pairAmount0);
      final size2 = getSizeRate(models[1].incomeUsd, pairAmount1);
      final size3 = getSizeRate(models[2].incomeUsd, pairAmount1);
      final size4 = getSizeRate(models[2].incomeUsd, pairAmount2);
      final size5 = getSizeRate(models[3].incomeUsd, pairAmount2);
      return [
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size0,
          color: colorIndex.colors[0],
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size1,
          color: colorIndex.colors[1],
          model: models[1],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: size4,
          color: colorIndex.colors[2],
          model: models[2],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: size5,
          color: colorIndex.colors[3],
          model: models[3],
        ),
      ];

    case 5:
      final pairAmount0 = models[0].incomeUsd + models[1].incomeUsd;
      final pairAmount1 = models[1].incomeUsd + models[2].incomeUsd;
      final pairAmount2 = models[2].incomeUsd + models[3].incomeUsd;
      final pairAmount3 = models[3].incomeUsd + models[4].incomeUsd;
      final size0 = getSizeRate(models[0].incomeUsd, pairAmount0);
      final size1 = getSizeRate(models[1].incomeUsd, pairAmount0);
      final size2 = getSizeRate(models[1].incomeUsd, pairAmount1);
      final size3 = getSizeRate(models[2].incomeUsd, pairAmount1);
      final size4 = getSizeRate(models[2].incomeUsd, pairAmount2);
      final size5 = getSizeRate(models[3].incomeUsd, pairAmount2);
      final size6 = getSizeRate(models[3].incomeUsd, pairAmount3);
      final size7 = getSizeRate(models[4].incomeUsd, pairAmount3);
      return [
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size0,
          color: colorIndex.colors[0],
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size1,
          color: colorIndex.colors[1],
          model: models[1],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: size4,
          color: colorIndex.colors[2],
          model: models[2],
        ),
        HeatMapModel(
          mainAxisSize: (size3 * size6 / 100).floor(),
          crossAxisSize: size5,
          color: colorIndex.colors[3],
          model: models[3],
        ),
        HeatMapModel(
          mainAxisSize: (size3 * size7 / 100).floor(),
          crossAxisSize: size5,
          color: colorIndex.colors[4],
          model: models[4],
        ),
      ];
    default:
      if (models.isEmpty) {
        return [];
      } else {
        final pairAmount0 = models[0].incomeUsd + models[1].incomeUsd;
        final pairAmount1 = models[1].incomeUsd + models[2].incomeUsd;
        final pairAmount2 = models[2].incomeUsd + models[3].incomeUsd;
        final pairAmount3 = models[3].incomeUsd + models[4].incomeUsd;
        final size0 = getSizeRate(models[0].incomeUsd, pairAmount0);
        final size1 = getSizeRate(models[1].incomeUsd, pairAmount0);
        final size2 = getSizeRate(models[1].incomeUsd, pairAmount1);
        final size3 = getSizeRate(models[2].incomeUsd, pairAmount1);
        final size4 = getSizeRate(models[2].incomeUsd, pairAmount2);
        final size5 = getSizeRate(models[3].incomeUsd, pairAmount2);
        final size6 = getSizeRate(models[3].incomeUsd, pairAmount3);
        final size7 = getSizeRate(models[4].incomeUsd, pairAmount3);
        return [
          HeatMapModel(
            mainAxisSize: size2,
            crossAxisSize: size0,
            color: colorIndex.colors[0],
            model: models[0],
          ),
          HeatMapModel(
            mainAxisSize: size2,
            crossAxisSize: size1,
            color: colorIndex.colors[1],
            model: models[1],
          ),
          HeatMapModel(
            mainAxisSize: size3,
            crossAxisSize: size4,
            color: colorIndex.colors[2],
            model: models[2],
          ),
          HeatMapModel(
            mainAxisSize: (size3 * size6 / 100).floor(),
            crossAxisSize: size5,
            color: colorIndex.colors[3],
            model: models[3],
          ),
          HeatMapModel(
            mainAxisSize: (size3 * size7 / 100).floor(),
            crossAxisSize: (size5 * 0.7).floor(),
            color: colorIndex.colors[4],
            model: models[4],
          ),
          HeatMapModel(
            mainAxisSize: (size3 * size7 / 100).floor(),
            crossAxisSize: (size5 * 0.3).floor(),
            color: colorIndex.colors[5],
            model: GsheetsModel(ticker: S.of(_context).others),
          ),
        ];
      }
  }
}
