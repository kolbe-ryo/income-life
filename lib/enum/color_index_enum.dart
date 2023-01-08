// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../generated/l10n.dart';
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

  String get value {
    final _context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    switch (this) {
      case ColorIndexEnum.normal:
        return S.of(_context).normal;
      case ColorIndexEnum.souring:
        return S.of(_context).souring;
      case ColorIndexEnum.crash:
        return S.of(_context).crach;
    }
  }
}
