// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_to_add_stock_page_state.freezed.dart';

@freezed
class RequestToAddStockPageState with _$RequestToAddStockPageState {
  const factory RequestToAddStockPageState({
    @Default('') String requestTicker,
  }) = _RequestToAddStockPageState;
}
