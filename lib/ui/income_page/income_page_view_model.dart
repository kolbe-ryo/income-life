import 'package:income_life/ui/global/stock_data_manager.dart';
import 'package:income_life/ui/income_page/income_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

class IncomePageViewModel extends StateNotifier<IncomePageState> with LocatorMixin {
  IncomePageViewModel([IncomePageState state = const IncomePageState()]) : super(state);

  @override
  void initState() {
    // Sort on total amount in order
    final sortedGsheets = read<StockDataManager>().info.gsheets
      ..sort(
        (b, a) => -a.totalAmount.compareTo(b.totalAmount),
      );
    state = state.copyWith(
      sortedGsheets: sortedGsheets,
    );
  }
}
