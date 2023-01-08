// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../enum/chart_theme_enum.dart';
import '../../enum/color_index_enum.dart';
import '../../enum/currency_value.dart';
import '../../util/logger.dart';
import '../interface/local_repository_interface.dart';
import '../model/gsheets_model.dart';

class LocalRepositoryDao implements LocalRepositoryInterface {
  factory LocalRepositoryDao() => _instance;

  LocalRepositoryDao._internal() {
    _storage = SharedPreferences.getInstance();
  }

  static final _instance = LocalRepositoryDao._internal();

  late final Future<SharedPreferences> _storage;

  static const kStorageKey = 'portfolio';

  static const kColorThemeKey = 'colorTheme';

  static const kChartThemeKey = 'chartTheme';

  static const kCurrencyValueKey = 'currencyValue';

  @override
  Future<List<GsheetsModel>> getLocalModel() async {
    final storage = await _storage;
    final contents = storage.getStringList(kStorageKey);
    final models = contents
            ?.map(
              (e) => GsheetsModel.fromJson(json.decode(e) as Map<String, dynamic>),
            )
            .toList() ??
        [];
    return models;
  }

  @override
  Future<ChartThemeEnum?> getLocalChartTheme() async {
    final storage = await _storage;
    final content = storage.getString(kChartThemeKey);
    if (content == null) {
      return null;
    }
    return ChartThemeEnum.values.byName(content);
  }

  @override
  Future<ColorIndexEnum?> getLocalColorTheme() async {
    final storage = await _storage;
    final content = storage.getString(kColorThemeKey);
    if (content == null) {
      return null;
    }
    return ColorIndexEnum.values.byName(content);
  }

  @override
  Future<CurrencyValue?> getLocalCurrencyValue() async {
    final storage = await _storage;
    final content = storage.getString(kCurrencyValueKey);
    if (content == null) {
      return null;
    }
    return CurrencyValue.values.byName(content);
  }

  @override
  Future<void> saveModel(List<GsheetsModel> list) async {
    final storage = await _storage;

    final contents = list.map((e) => json.encode(e.toJson())).toList();

    await storage.setStringList(kStorageKey, contents);
  }

  @override
  Future<void> saveChartTheme(ChartThemeEnum theme) async {
    final storage = await _storage;
    await storage.setString(kChartThemeKey, theme.name);
  }

  @override
  Future<void> saveColorTheme(ColorIndexEnum theme) async {
    final storage = await _storage;
    await storage.setString(kColorThemeKey, theme.name);
  }

  @override
  Future<void> saveCurrencyValue(CurrencyValue value) async {
    final storage = await _storage;
    await storage.setString(kCurrencyValueKey, value.name);
  }

  @override
  Future<void> deleteAll() async {
    final storage = await _storage;
    final delete = await storage.clear();
    logger.info(delete);
  }
}
