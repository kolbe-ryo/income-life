// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import '../generated/l10n.dart';

enum ChartThemeEnum {
  @JsonValue('heatMap')
  heatMap,
  @JsonValue('pieChart')
  pieChart,
}

extension ChartThemeEnumExt on ChartThemeEnum {
  String get value {
    final _context = GetIt.I<GlobalKey<NavigatorState>>().currentContext!;
    switch (this) {
      case ChartThemeEnum.heatMap:
        return S.of(_context).heatMap;
      case ChartThemeEnum.pieChart:
        return S.of(_context).pieChart;
    }
  }
}
