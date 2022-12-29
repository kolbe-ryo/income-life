// Project imports:
import '../model/gsheets_model.dart';

abstract class GsheetsInterface {
  // fetch gsheets data of stock data
  Future<List<GsheetsModel>> fetch();

  // fetch gsheets data of exchange rate
  Future<double> fetchExchangeRate();

  // write request stock to request sheet
  Future<void> writeRequestStock(String ticker);
}
