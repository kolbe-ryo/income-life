// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../ui/common/app_colors.dart';

enum ColorIndexEnum {
  normal,
  souring,
  crash,
}

extension ColorIndexEnumExt on ColorIndexEnum {
  List<Color> get colors {
    switch (this) {
      case ColorIndexEnum.normal:
        return [
          AppColors.teal,
          AppColors.redAccent.shade100,
          AppColors.redAccent,
          AppColors.teal.shade300,
          AppColors.teal.shade200,
          AppColors.blueGrey,
        ];
      case ColorIndexEnum.souring:
        return [
          AppColors.teal,
          AppColors.teal.shade200,
          AppColors.teal.shade300,
          AppColors.teal.shade700,
          AppColors.teal,
          AppColors.blueGrey,
        ];
      case ColorIndexEnum.crash:
        return [
          AppColors.redAccent.shade700,
          AppColors.deepOrangeAccent,
          AppColors.redAccent,
          AppColors.redAccent.shade200,
          AppColors.redAccent.shade100,
          AppColors.blueGrey,
        ];
    }
  }
}
