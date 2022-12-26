// Project imports:
import 'package:income_life/enum/chart_theme_enum.dart';
import 'package:income_life/enum/color_index_enum.dart';

import '../model/gsheets_model.dart';

abstract class LocalRepositoryInterface {
  // get data from local repository
  Future<List<GsheetsModel>> getLocalModel();

  Future<ChartThemeEnum?> getLocalChartTheme();

  Future<ColorIndexEnum?> getLocalColorTheme();

  // save data to local repository
  Future<void> saveModel(List<GsheetsModel> list);

  Future<void> saveChartTheme(ChartThemeEnum theme);

  Future<void> saveColorTheme(ColorIndexEnum theme);

  Future<void> deleteAll();
}
