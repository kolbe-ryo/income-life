// Package imports:
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import '../data/dao/gsheets_dao.dart';
import '../data/dao/local_repository_dao.dart';
import '../data/interface/gsheets_interface.dart';
import '../data/interface/local_repository_interface.dart';
import '../util/admob.dart';

void setUpDI() {
  GetIt.I.registerLazySingleton<GsheetsInterface>(_gsheetsDao);
  GetIt.I.registerLazySingleton<LocalRepositoryInterface>(_localRepositoryDao);
  GetIt.I.registerLazySingleton<Admob>(_admob);
  GetIt.I.registerLazySingleton<GlobalKey<NavigatorState>>(_globalKey);
}

GsheetsDao _gsheetsDao() => GsheetsDao();
LocalRepositoryDao _localRepositoryDao() => LocalRepositoryDao();
Admob _admob() => Admob();
GlobalKey<NavigatorState> _globalKey() => GlobalKey();
