// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../enum/added_condition_enum.dart';

part 'search_stock_page_state.freezed.dart';

@freezed
class SearchStockPageState with _$SearchStockPageState {
  const factory SearchStockPageState({
    @Default(AddedConditionEnum.all) AddedConditionEnum condition,
    @Default(0) int stocks,
  }) = _SearchStockPageState;
}
