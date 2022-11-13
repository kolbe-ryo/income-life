import 'package:get_it/get_it.dart';
import 'package:income_life/data/dao/gsheets_dao.dart';
import 'package:income_life/data/interface/gsheets_interface.dart';

void setUpDI() {
  GetIt.I.registerSingleton<GsheetsInterface>(GsheetsDao());
}
