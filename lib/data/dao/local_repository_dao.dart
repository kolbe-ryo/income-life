// Project imports:
import 'dart:convert';

import 'package:income_life/data/model/gsheets_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interface/local_repository_interface.dart';

class LocalRepositoryDao implements LocalRepositoryInterface {
  factory LocalRepositoryDao() => _instance;

  LocalRepositoryDao._internal() {
    _storage = SharedPreferences.getInstance();
  }

  static final _instance = LocalRepositoryDao._internal();

  late final Future<SharedPreferences> _storage;

  static const kStorageKey = 'portfolio';

  @override
  Future<List<GsheetsModel>> getLocal() async {
    final storage = await _storage;
    final contents = storage.getStringList(kStorageKey);
    final models = contents
            ?.map(
              (e) => GsheetsModel.fromJson(json.decode(e) as Map<String, dynamic>),
            )
            .toList() ??
        [];
    return models;
  }

  @override
  Future<void> save(List<GsheetsModel> list) async {
    final storage = await _storage;

    final contents = list.map((e) => json.encode(e.toJson())).toList();

    await storage.setStringList(kStorageKey, contents);
  }
}
