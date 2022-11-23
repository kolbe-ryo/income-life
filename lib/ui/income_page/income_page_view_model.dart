import 'package:income_life/ui/global/stock_data_manager.dart';
import 'package:income_life/ui/income_page/income_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

class IncomePageViewModel extends StateNotifier<IncomePageState> with LocatorMixin {
  IncomePageViewModel([super.state = const IncomePageState()]);

  @override
  void initState() {
    // Sort on total amount in order
    final sortedGsheets = read<StockDataManager>()
        .info
        .gsheets
        .where(
          (e) => e.isAddedPortfolio,
        )
        .toList()
      ..sort(
        (a, b) => -a.income.compareTo(b.income),
      );
    state = state.copyWith(
      sortedGsheets: sortedGsheets,
    );
  }
}
