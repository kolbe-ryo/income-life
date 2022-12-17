// Project imports:
import 'package:flutter/material.dart';

import '../../../data/model/gsheets_model.dart';
import '../../../data/model/heat_map_model.dart';
import '../../common/app_colors.dart';

List<HeatMapModel> heatMapStruct(List<GsheetsModel> models) {
  int getSizeRate(
    double selfAmount,
    double pairAmount,
  ) =>
      (100 * selfAmount / pairAmount).floor();

  switch (models.length) {
    case 1:
      return [
        HeatMapModel(
          mainAxisSize: 100,
          crossAxisSize: 100,
          color: AppColors.teal,
          model: models[0],
        ),
      ];

    case 2:
      final pairAmount0 = models[0].income + models[1].income;
      final size0 = getSizeRate(models[0].income, pairAmount0);
      final size1 = getSizeRate(models[1].income, pairAmount0);
      return [
        HeatMapModel(
          mainAxisSize: 100,
          crossAxisSize: size0,
          color: AppColors.teal,
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: 100,
          crossAxisSize: size1,
          color: AppColors.deepOrangeAccent,
          model: models[1],
        ),
      ];

    case 3:
      final pairAmount0 = models[0].income + models[1].income;
      final pairAmount1 = models[1].income + models[2].income;
      final size0 = getSizeRate(models[0].income, pairAmount0);
      final size1 = getSizeRate(models[1].income, pairAmount0);
      final size2 = getSizeRate(models[1].income, pairAmount1);
      final size3 = getSizeRate(models[2].income, pairAmount1);
      return [
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size0,
          color: AppColors.teal,
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size1,
          color: AppColors.deepOrangeAccent,
          model: models[1],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: 100,
          color: AppColors.redAccent,
          model: models[2],
        ),
      ];

    case 4:
      final pairAmount0 = models[0].income + models[1].income;
      final pairAmount1 = models[1].income + models[2].income;
      final pairAmount2 = models[2].income + models[3].income;
      final size0 = getSizeRate(models[0].income, pairAmount0);
      final size1 = getSizeRate(models[1].income, pairAmount0);
      final size2 = getSizeRate(models[1].income, pairAmount1);
      final size3 = getSizeRate(models[2].income, pairAmount1);
      final size4 = getSizeRate(models[2].income, pairAmount2);
      final size5 = getSizeRate(models[3].income, pairAmount2);
      return [
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size0,
          color: AppColors.teal,
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size1,
          color: AppColors.deepOrangeAccent,
          model: models[1],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: size4,
          color: AppColors.redAccent,
          model: models[2],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: size5,
          color: AppColors.greenAccent,
          model: models[3],
        ),
      ];

    case 5:
      final pairAmount0 = models[0].income + models[1].income;
      final pairAmount1 = models[1].income + models[2].income;
      final pairAmount2 = models[2].income + models[3].income;
      final pairAmount3 = models[3].income + models[4].income;
      final size0 = getSizeRate(models[0].income, pairAmount0);
      final size1 = getSizeRate(models[1].income, pairAmount0);
      final size2 = getSizeRate(models[1].income, pairAmount1);
      final size3 = getSizeRate(models[2].income, pairAmount1);
      final size4 = getSizeRate(models[2].income, pairAmount2);
      final size5 = getSizeRate(models[3].income, pairAmount2);
      final size6 = getSizeRate(models[3].income, pairAmount3);
      final size7 = getSizeRate(models[4].income, pairAmount3);
      return [
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size0,
          color: AppColors.teal,
          model: models[0],
        ),
        HeatMapModel(
          mainAxisSize: size2,
          crossAxisSize: size1,
          color: AppColors.deepOrangeAccent,
          model: models[1],
        ),
        HeatMapModel(
          mainAxisSize: size3,
          crossAxisSize: size4,
          color: AppColors.redAccent,
          model: models[2],
        ),
        HeatMapModel(
          mainAxisSize: (size3 * size6 / 100).floor(),
          crossAxisSize: size5,
          color: AppColors.greenAccent,
          model: models[3],
        ),
        HeatMapModel(
          mainAxisSize: (size3 * size7 / 100).floor(),
          crossAxisSize: size5,
          color: AppColors.tealAccent,
          model: models[4],
        ),
      ];
    default:
      if (models.isEmpty) {
        return [];
      } else {
        final pairAmount0 = models[0].income + models[1].income;
        final pairAmount1 = models[1].income + models[2].income;
        final pairAmount2 = models[2].income + models[3].income;
        final pairAmount3 = models[3].income + models[4].income;
        final size0 = getSizeRate(models[0].income, pairAmount0);
        final size1 = getSizeRate(models[1].income, pairAmount0);
        final size2 = getSizeRate(models[1].income, pairAmount1);
        final size3 = getSizeRate(models[2].income, pairAmount1);
        final size4 = getSizeRate(models[2].income, pairAmount2);
        final size5 = getSizeRate(models[3].income, pairAmount2);
        final size6 = getSizeRate(models[3].income, pairAmount3);
        final size7 = getSizeRate(models[4].income, pairAmount3);
        return [
          HeatMapModel(
            mainAxisSize: size2,
            crossAxisSize: size0,
            color: AppColors.teal,
            model: models[0],
          ),
          HeatMapModel(
            mainAxisSize: size2,
            crossAxisSize: size1,
            color: AppColors.deepOrangeAccent,
            model: models[1],
          ),
          HeatMapModel(
            mainAxisSize: size3,
            crossAxisSize: size4,
            color: AppColors.redAccent,
            model: models[2],
          ),
          HeatMapModel(
            mainAxisSize: (size3 * size6 / 100).floor(),
            crossAxisSize: size5,
            color: AppColors.greenAccent,
            model: models[3],
          ),
          HeatMapModel(
            mainAxisSize: (size3 * size7 / 100).floor(),
            crossAxisSize: (size5 * 0.7).floor(),
            color: AppColors.tealAccent,
            model: models[4],
          ),
          HeatMapModel(
            mainAxisSize: (size3 * size7 / 100).floor(),
            crossAxisSize: (size5 * 0.3).floor(),
            color: AppColors.blueGrey,
            model: const GsheetsModel(ticker: 'Others'),
          ),
        ];
      }
  }
}

// List<Color> getHeatMapColor() {

// }