// Package imports:
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../enum/added_condition_enum.dart';
import 'search_stock_page_state.dart';

class SearchStockPageViewModel extends StateNotifier<SearchStockPageState> {
  SearchStockPageViewModel([super.state = const SearchStockPageState()]);

  void switchCondition() {
    final condition = AddedConditionEnum.values
        .where(
          (e) =>
              (e.index == AddedConditionEnum.values.indexWhere((e) => e == state.condition) + 1) ||
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
}
