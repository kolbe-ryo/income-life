// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';

part 'income_page_state.freezed.dart';

@freezed
class IncomePageState with _$IncomePageState {
  const factory IncomePageState({
    @Default(<GsheetsModel>[]) List<GsheetsModel> sortedGsheets,
  }) = _IncomePageState;

  const IncomePageState._();

  int get length => sortedGsheets.length;
}
