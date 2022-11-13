// Project imports:
import '../model/gsheets_model.dart';

abstract class GsheetsInterface {
  // fetch gsheets data from internet
  Future<List<GsheetsModel>> fetch();

  // fetch gsheets data from local repository
  Future<List<GsheetsModel>> get();

  // check length for needs to update
  int checkDataLength();

  // save data to local repository
  void save();
}
