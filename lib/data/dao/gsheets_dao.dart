// Package imports:
import 'package:gsheets/gsheets.dart';

// Project imports:
import '../../enum/currency_value.dart';
import '../../util/logger.dart';
import '../interface/gsheets_interface.dart';
import '../model/gsheets_model.dart';

class GsheetsDao implements GsheetsInterface {
  static final _gsheets = GSheets(gSheetsCredentials);

  @override
  Future<List<GsheetsModel>> fetch() async {
    try {
      final sheets = await _gsheets.spreadsheet(gSheetsId);
      final sheet = sheets.worksheetByTitle('data');
      final allData = await sheet!.values.allRows(fromRow: 2, length: 5);
      final exchangeRate = await _fetchExchangeRate();

      return allData
          .map(
            (row) => GsheetsModel(
              market: toEnum(row[0]),
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
  int checkDataLength() {
    // TODO: implement checkDataLength
    throw UnimplementedError();
  }

  @override
  void save() {
    // TODO: implement save
  }

  @override
  Future<double> _fetchExchangeRate() async {
    try {
      final sheets = await _gsheets.spreadsheet(gSheetsId);
      final sheet = sheets.worksheetByTitle('exchange');
      final allData = await sheet!.values.allRows(fromRow: 1, length: 1);

      return double.parse(allData.first.first);
    } on Exception catch (error) {
      logger.info(error);
      throw UnimplementedError();
    }
  }

  @override
  Future<List<GsheetsModel>> getLocal() {
    // TODO: implement getLocal
    throw UnimplementedError();
  }
}
