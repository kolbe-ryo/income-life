// Project imports:
import '../model/gsheets_model.dart';

abstract class GsheetsInterface {
  // fetch gsheets data from internet
  Future<List<GsheetsModel>> fetch();

  // fetch gsheets data from internet
  Future<double> fetchExchangeRate();
}
