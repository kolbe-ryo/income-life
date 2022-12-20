// Project imports:
import '../model/gsheets_model.dart';

abstract class LocalRepositoryInterface {
  // get data from local repository
  Future<List<GsheetsModel>> getLocal();

  Future<List<String>> getForTheme();

  // save data to local repository
  Future<void> save(List<GsheetsModel> list);

  Future<void> saveForTheme(List<String> themes);

  Future<void> deleteAll();
}
