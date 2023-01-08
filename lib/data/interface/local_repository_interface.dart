// Project imports:
import '../../enum/chart_theme_enum.dart';
import '../../enum/color_index_enum.dart';
import '../../enum/currency_value.dart';
import '../model/gsheets_model.dart';

abstract class LocalRepositoryInterface {
  // get data from local repository
  Future<List<GsheetsModel>> getLocalModel();

  Future<ChartThemeEnum?> getLocalChartTheme();

  Future<ColorIndexEnum?> getLocalColorTheme();

  Future<CurrencyValue?> getLocalCurrencyValue();

  // save data to local repository
  Future<void> saveModel(List<GsheetsModel> list);

  Future<void> saveChartTheme(ChartThemeEnum theme);

  Future<void> saveColorTheme(ColorIndexEnum theme);

  Future<void> saveCurrencyValue(CurrencyValue value);

  Future<void> deleteAll();
}
