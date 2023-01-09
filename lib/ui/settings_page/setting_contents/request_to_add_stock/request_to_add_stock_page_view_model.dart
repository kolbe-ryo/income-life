// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../../../data/interface/gsheets_interface.dart';
import '../../../../util/logger.dart';
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

  Future<bool> request() async {
    try {
      await GetIt.I<GsheetsInterface>().writeRequestStock(state.requestTicker);
      return true;
    } on Exception catch (e) {
      logger.info(e);
      return false;
    } finally {
      _controller.clear();
    }
  }

  void inputTicker(String value) {
    state = state.copyWith(requestTicker: value);
  }
}
