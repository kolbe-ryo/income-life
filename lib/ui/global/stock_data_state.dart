// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';

part 'stock_data_state.freezed.dart';

@freezed
class StockDataState with _$StockDataState {
  const factory StockDataState({
    @Default(<GsheetsModel>[]) List<GsheetsModel> gsheets,
  }) = _StockDataState;
}
