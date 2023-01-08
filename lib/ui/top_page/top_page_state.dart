// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../enum/chart_theme_enum.dart';
import '../../enum/color_index_enum.dart';
import '../../enum/currency_value.dart';

part 'top_page_state.freezed.dart';

@freezed
class TopPageState with _$TopPageState {
  const factory TopPageState({
    @Default(0) int pageIndex,
    @Default(ColorIndexEnum.normal) ColorIndexEnum colorTheme,
    @Default(ChartThemeEnum.heatMap) ChartThemeEnum chartTheme,
    @Default(CurrencyValue.usd) CurrencyValue currencyValue,
  }) = _TopPageState;
}
