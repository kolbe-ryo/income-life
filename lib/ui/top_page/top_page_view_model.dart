import 'package:get_it/get_it.dart';
import 'package:income_life/data/interface/gsheets_interface.dart';
import 'package:income_life/data/model/gsheets_model.dart';

class TopPageViewModel {
  static List<GsheetsModel>? _sheets;

  static List<GsheetsModel>? get sheets => _sheets;

  Future<void> fetch() async {
    _sheets = await GetIt.I<GsheetsInterface>().fetch();
  }
}
