// Package imports:
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../../../data/interface/gsheets_interface.dart';

class RequestToAddStockPageViewModel {
  RequestToAddStockPageViewModel();

  Future<void> request(String ticker) async {
    // await GetIt.I<GsheetsInterface>().writeRequestStock(ticker);
  }
}
