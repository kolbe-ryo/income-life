import 'package:income_life/enum/added_condition_enum.dart';
import 'package:income_life/ui/search_stock_page/search_stock_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

class SearchStockPageViewModel extends StateNotifier<SearchStockPageState> {
  SearchStockPageViewModel([super.state = const SearchStockPageState()]);

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

  void inputNumverOfStock(int stocks) => state = state.copyWith(stocks: stocks);
}
