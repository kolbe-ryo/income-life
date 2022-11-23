// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:income_life/enum/added_condition_enum.dart';

part 'search_stock_page_state.freezed.dart';

@freezed
class SearchStockPageState with _$SearchStockPageState {
  const factory SearchStockPageState({
    @Default(AddedConditionEnum.all) AddedConditionEnum condition,
  }) = _SearchStockPageState;
}
