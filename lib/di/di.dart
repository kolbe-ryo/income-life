// Package imports:
import 'package:get_it/get_it.dart';
import 'package:income_life/data/dao/local_repository_dao.dart';
import 'package:income_life/data/interface/local_repository_interface.dart';

// Project imports:
import '../data/dao/gsheets_dao.dart';
import '../data/interface/gsheets_interface.dart';

void setUpDI() {
  GetIt.I.registerSingleton<GsheetsInterface>(GsheetsDao());
  GetIt.I.registerSingleton<LocalRepositoryInterface>(LocalRepositoryDao());
}
