// Package imports:
import 'package:gsheets/gsheets.dart';

// Project imports:
import '../../enum/currency_value.dart';
import '../../ipass.dart';
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

      return allData
          .map(
            (row) => GsheetsModel(
              market: toEnum(row[0]),
              ticker: row[1],
              name: row[2],
              price: double.parse(row[3]),
              devidend: double.parse(row[4]),
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
  Future<List<GsheetsModel>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  void save() {
    // TODO: implement save
  }
}
