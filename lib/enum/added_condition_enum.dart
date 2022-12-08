// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../ui/common/app_colors.dart';

enum AddedConditionEnum {
  isAdded,
  notAdded,
  all,
}

extension AddedConditionEnumExt on AddedConditionEnum {
  Color get color {
    switch (this) {
      case AddedConditionEnum.isAdded:
        return AppColors.deepOrangeAccent;
      case AddedConditionEnum.notAdded:
        return AppColors.teal;
      case AddedConditionEnum.all:
        return AppColors.amber;
    }
  }
}
