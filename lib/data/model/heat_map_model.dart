// Package imports:
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:income_life/data/model/gsheets_model.dart';

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
