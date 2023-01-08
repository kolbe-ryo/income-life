// Package imports:
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../../../../enum/chart_theme_enum.dart';
import '../../../../enum/color_index_enum.dart';
import '../../../../enum/currency_value.dart';
import '../../../top_page/top_page_view_model.dart';
import 'chart_theme_setting_page_state.dart';

class ChartThemeSettingPageViewModel extends StateNotifier<ChartThemeSettingPageState> with LocatorMixin {
  ChartThemeSettingPageViewModel() : super(const ChartThemeSettingPageState());

  TopPageViewModel get _topPageViewModel => read();

  @override
  void initState() {
    super.initState();
    state = state.copyWith(
      colorTheme: _topPageViewModel.state.colorTheme,
      chartTheme: _topPageViewModel.state.chartTheme,
    );
  }

  void switchColorTheme(ColorIndexEnum colorTheme) {
    state = state.copyWith(colorTheme: colorTheme);
    _topPageViewModel.switchColorTheme(colorTheme);
  }

  void switchChartTheme(ChartThemeEnum chartTheme) {
    state = state.copyWith(chartTheme: chartTheme);
    _topPageViewModel.switchChartTheme(chartTheme);
  }

  void switchCurrencyValue(CurrencyValue currencyValue) {
    state = state.copyWith(currencyValue: currencyValue);
    _topPageViewModel.switchCurrencyValue(currencyValue);
  }
}
