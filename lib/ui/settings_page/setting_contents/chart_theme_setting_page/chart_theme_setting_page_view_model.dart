import 'package:income_life/enum/chart_theme_enum.dart';
import 'package:income_life/enum/color_index_enum.dart';
import 'package:income_life/ui/settings_page/setting_contents/chart_theme_setting_page/chart_theme_setting_page_state.dart';
import 'package:income_life/ui/top_page/top_page_view_model.dart';
import 'package:state_notifier/state_notifier.dart';

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
}
