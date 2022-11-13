import 'package:get_it/get_it.dart';
import 'package:income_life/data/interface/gsheets_interface.dart';
import 'package:income_life/ui/top_page/top_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

class TopPageViewModel extends StateNotifier<TopPageState> {
  TopPageViewModel() : super(const TopPageState());

  Future<void> fetch() async {
    state = state.copyWith(gsheets: await GetIt.I<GsheetsInterface>().fetch());
  }

  void switchBNB(int index) => state = state.copyWith(pageIndex: index);
}
