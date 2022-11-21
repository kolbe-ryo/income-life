// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';

part 'stock_data_state.freezed.dart';

@freezed
class StockDataState with _$StockDataState {
  const factory StockDataState({
    @Default(<GsheetsModel>[]) List<GsheetsModel> gsheets,
    @Default(0) double exchangeRate,
  }) = _StockDataState;

  const StockDataState._();

  int get length => gsheets.length;
}
