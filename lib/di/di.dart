// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../data/dao/gsheets_dao.dart';
import '../data/interface/gsheets_interface.dart';

void setUpDI() {
  GetIt.I.registerSingleton<GsheetsInterface>(GsheetsDao());
}
