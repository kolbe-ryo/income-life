// Package imports:
import 'package:flutter/material.dart';
import 'package:income_life/data/model/gsheets_model.dart';
import 'package:income_life/ui/global/stock_data_manager.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../enum/added_condition_enum.dart';
import 'search_stock_page_state.dart';

class SearchStockPageViewModel extends StateNotifier<SearchStockPageState> with LocatorMixin {
  SearchStockPageViewModel([super.state = const SearchStockPageState()]);

  late final TextEditingController _controller;

  TextEditingController get controller => _controller;

  StockDataManager get manager => read();

  DateTime _last = DateTime.now();

  @override
  void initState() {
    super.initState();
    final models = manager.selectGsheets(
      state: manager.state,
      condition: state.condition,
    );
    state = state.copyWith(searchedGsheets: models);
    _controller = TextEditingController();
  }

  void load() {
    final models = manager.selectGsheets(
      state: manager.state,
      condition: state.condition,
    );
    state = state.copyWith(searchedGsheets: models);
    _controller.clear();
  }

  // Change each condition(isAdded, isNotAdded or All) to tap the FAB
  void switchCondition() {
    final condition = AddedConditionEnum.values
        .where(
          (e) =>
              (e.index ==
                  AddedConditionEnum.values.indexWhere(
                        (e) => e == state.condition,
                      ) +
                      1) ||
              e.index ==
                  AddedConditionEnum.values.indexWhere(
                        (e) => e == state.condition,
                      ) -
                      2,
        )
        .toList()
        .first;
    state = state.copyWith(condition: condition);
  }

  void searchText(String text) {
    final models = manager.info.gsheets;
    Future<dynamic>.delayed(const Duration(milliseconds: 500), () {
      final now = DateTime.now();
      if (now.difference(_last).inMilliseconds < 500) {
        return;
      }
      _last = now;

      // Searching treatment
      if (text.trim().isEmpty) {
        state = state.copyWith(searchedGsheets: models, isSearching: false);
      } else {
        final searchedModels = models
            .where(
              (e) => e.name.toLowerCase().contains(text) || e.ticker.toLowerCase().contains(text),
            )
            .toList();
        state = state.copyWith(searchedGsheets: searchedModels, isSearching: true);
      }
    });
    _last = DateTime.now();
  }

  List<GsheetsModel> selectGsheets({
    required SearchStockPageState state,
  }) {
    switch (state.condition) {
      case AddedConditionEnum.isAdded:
        return state.portfolio;
      case AddedConditionEnum.notAdded:
        return state.notPortfolio;
      case AddedConditionEnum.all:
        return state.searchedGsheets;
    }
  }
}
