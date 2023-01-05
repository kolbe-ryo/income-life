// Package imports:
import 'package:flutter/material.dart';
import 'package:income_life/ui/settings_page/setting_contents/request_to_add_stock/request_to_add_stock_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

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
