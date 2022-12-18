// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:income_life/enum/chart_theme_enum.dart';
import 'package:income_life/enum/color_index_enum.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../enum/bnb_items.dart';
import '../../util/admob.dart';
import 'top_page_state.dart';

class TopPageViewModel extends StateNotifier<TopPageState> with LocatorMixin {
  TopPageViewModel() : super(const TopPageState());

  late final Map<BnbItems, GlobalKey<NavigatorState>> _navigatorKeys;

  late final Future<Widget> _admobBanner;

  Map<BnbItems, GlobalKey<NavigatorState>> get navigatorKeys => _navigatorKeys;

  Future<Widget> get admobBanner => _admobBanner;

  @override
  void initState() {
    super.initState();
    _navigatorKeys = <BnbItems, GlobalKey<NavigatorState>>{
      BnbItems.income: GlobalKey<NavigatorState>(),
      BnbItems.search: GlobalKey<NavigatorState>(),
      BnbItems.settings: GlobalKey<NavigatorState>(),
    };
    _admobBanner = GetIt.I<Admob>().getBannerWidget();
  }

  void switchBNB(int index) {
    state = state.copyWith(pageIndex: index);
  }

  void switchColorTheme(ColorIndexEnum colorTheme) {
    state = state.copyWith(colorTheme: colorTheme);
  }

  void switchChartTheme(ChartThemeEnum chartTheme) {
    state = state.copyWith(chartTheme: chartTheme);
  }
}
