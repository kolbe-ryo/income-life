// Project imports:
import '../model/gsheets_model.dart';

abstract class LocalRepositoryInterface {
  // fetch gsheets data from local repository
  Future<List<GsheetsModel>> getLocal();

  // save data to local repository
  Future<void> save(List<GsheetsModel> list);
}
