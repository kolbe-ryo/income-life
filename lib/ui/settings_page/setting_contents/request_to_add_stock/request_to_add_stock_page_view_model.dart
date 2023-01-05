// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'request_to_add_stock_page_state.dart';

class RequestToAddStockPageViewModel extends StateNotifier<RequestToAddStockPageState> with LocatorMixin {
  RequestToAddStockPageViewModel() : super(const RequestToAddStockPageState());

  late final TextEditingController _controller;

  TextEditingController get controller => _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> request(String ticker) async {
    _controller.clear();
    // await GetIt.I<GsheetsInterface>().writeRequestStock(ticker);
    return true;
  }

  void inputTicker(String value) {
    state = state.copyWith(requestTicker: value);
  }
}
