// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:gsheets/gsheets.dart';

// Project imports:
import '../../enum/currency_value.dart';
import '../../util/flavor_text.dart';
import '../../util/logger.dart';
import '../interface/gsheets_interface.dart';
import '../model/gsheets_model.dart';

class GsheetsDao implements GsheetsInterface {
  factory GsheetsDao() => _instance;

  GsheetsDao._internal() {
    _gsheets = GSheets(json.encode(jsogSheetsCredentialsnKey));
  }

  static final _instance = GsheetsDao._internal();

  late final GSheets _gsheets;

  @override
  Future<List<GsheetsModel>> fetch() async {
    try {
      final sheets = await _gsheets.spreadsheet(gSheetsId);
      final sheet = sheets.worksheetByTitle('data');
      final allData = await sheet!.values.allRows(fromRow: 2, length: 5);
      final exchangeRate = await fetchExchangeRate();

      return allData
          .map(
            (row) => GsheetsModel(
              market: toEnum(row[0]) ?? CurrencyValue.usd,
              ticker: row[1],
              name: row[2],
              price: double.parse(row[3]),
              devidend: double.parse(row[4]),
              exchangeRate: exchangeRate,
            ),
          )
          .toList();
    } on Exception catch (error) {
      logger.info(error);
      throw UnimplementedError();
    }
  }

  @override
  Future<double> fetchExchangeRate() async {
    try {
      final sheets = await _gsheets.spreadsheet(gSheetsId);
      final sheet = sheets.worksheetByTitle('exchange');
      final allData = await sheet!.values.allRows(length: 1);

      return double.parse(allData.first.first);
    } on Exception catch (error) {
      logger.info(error);
      throw UnimplementedError();
    }
  }

  @override
  Future<void> writeRequestStock(String ticker) async {
    try {
      final sheets = await _gsheets.spreadsheet(gSheetsId);
      final sheet = sheets.worksheetByTitle('requests');
      final lastRow = (await sheet!.values.allRows()).length;
      await sheet.values.insertValue(ticker, column: 1, row: lastRow + 1);
    } on Exception catch (error) {
      logger.info(error);
      throw UnimplementedError();
    }
  }
}
