// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'gsheets_model.dart';

part 'heat_map_model.freezed.dart';

@freezed
class HeatMapModel with _$HeatMapModel {
  const factory HeatMapModel({
    @Default(0) int mainAxisSize,
    @Default(0) int crossAxisSize,
    @Default(Colors.white) Color color,
    @Default(GsheetsModel()) GsheetsModel model,
  }) = _HeatMapModel;
}
