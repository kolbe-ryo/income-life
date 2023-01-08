// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:income_life/enum/currency_value.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../data/interface/local_repository_interface.dart';
import '../../enum/bnb_items.dart';
import '../../enum/chart_theme_enum.dart';
import '../../enum/color_index_enum.dart';
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
    _fetchThemeFromLocal();
  }

  Future<void> _fetchThemeFromLocal() async {
    final localColorTheme = await GetIt.I<LocalRepositoryInterface>().getLocalColorTheme();
    final localChartTheme = await GetIt.I<LocalRepositoryInterface>().getLocalChartTheme();
    final localCurrencyValue = await GetIt.I<LocalRepositoryInterface>().getLocalCurrencyValue();

    state = state.copyWith(
      chartTheme: localChartTheme ?? state.chartTheme,
      colorTheme: localColorTheme ?? state.colorTheme,
      currencyValue: localCurrencyValue ?? state.currencyValue,
    );
  }

  Future<void> _saveToLocal() async {
    await GetIt.I<LocalRepositoryInterface>().saveChartTheme(state.chartTheme);
    await GetIt.I<LocalRepositoryInterface>().saveColorTheme(state.colorTheme);
    await GetIt.I<LocalRepositoryInterface>().saveCurrencyValue(state.currencyValue);
  }

  void switchBNB(int index) {
    state = state.copyWith(pageIndex: index);
  }

  void switchColorTheme(ColorIndexEnum colorTheme) {
    state = state.copyWith(colorTheme: colorTheme);
    _saveToLocal();
  }

  void switchChartTheme(ChartThemeEnum chartTheme) {
    state = state.copyWith(chartTheme: chartTheme);
    _saveToLocal();
  }

  void switchCurrencyValue(CurrencyValue currencyValue) {
    state = state.copyWith(currencyValue: currencyValue);
    _saveToLocal();
  }
}
