// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../data/dao/gsheets_dao.dart';
import '../data/dao/local_repository_dao.dart';
import '../data/interface/gsheets_interface.dart';
import '../data/interface/local_repository_interface.dart';

void setUpDI() {
  GetIt.I.registerSingleton<GsheetsInterface>(GsheetsDao());
  GetIt.I.registerSingleton<LocalRepositoryInterface>(LocalRepositoryDao());
}
