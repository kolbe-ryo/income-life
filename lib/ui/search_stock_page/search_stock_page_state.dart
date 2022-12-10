// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../enum/added_condition_enum.dart';

part 'search_stock_page_state.freezed.dart';

@freezed
class SearchStockPageState with _$SearchStockPageState {
  const factory SearchStockPageState({
    @Default(AddedConditionEnum.all) AddedConditionEnum condition,
    @Default(<GsheetsModel>[]) List<GsheetsModel> searchedGsheets,
    @Default(false) bool isSearching,
  }) = _SearchStockPageState;

  const SearchStockPageState._();

  List<GsheetsModel> get portfolio => searchedGsheets
      .where(
        (e) => e.isAddedPortfolio,
      )
      .toList();

  List<GsheetsModel> get notPortfolio => searchedGsheets
      .where(
        (e) => !e.isAddedPortfolio,
      )
      .toList();
}
