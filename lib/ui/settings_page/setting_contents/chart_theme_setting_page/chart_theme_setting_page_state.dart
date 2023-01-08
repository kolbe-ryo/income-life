// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../../../enum/chart_theme_enum.dart';
import '../../../../enum/color_index_enum.dart';
import '../../../../enum/currency_value.dart';

part 'chart_theme_setting_page_state.freezed.dart';

@freezed
class ChartThemeSettingPageState with _$ChartThemeSettingPageState {
  const factory ChartThemeSettingPageState({
    @Default(ColorIndexEnum.normal) ColorIndexEnum colorTheme,
    @Default(ChartThemeEnum.heatMap) ChartThemeEnum chartTheme,
    @Default(CurrencyValue.usd) CurrencyValue currencyValue,
  }) = _ChartThemeSettingPageState;
}
