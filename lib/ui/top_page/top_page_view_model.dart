// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../data/model/gsheets_model.dart';
import '../../enum/currency_value.dart';
import '../../data/interface/gsheets_interface.dart';
import '../../enum/bnb_items.dart';
import 'top_page_state.dart';

class TopPageViewModel extends StateNotifier<TopPageState> with LocatorMixin {
  TopPageViewModel() : super(const TopPageState());

  late final Map<BnbItems, GlobalKey<NavigatorState>> _navigatorKeys;

  Map<BnbItems, GlobalKey<NavigatorState>> get navigatorKeys => _navigatorKeys;

  @override
  void initState() {
    _navigatorKeys = <BnbItems, GlobalKey<NavigatorState>>{
      BnbItems.income: GlobalKey<NavigatorState>(),
      BnbItems.search: GlobalKey<NavigatorState>(),
      BnbItems.settings: GlobalKey<NavigatorState>(),
    };
  }

  void switchBNB(int index) => state = state.copyWith(pageIndex: index);
}
