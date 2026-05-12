import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/service/storage_service.dart';

class SharedPrefsStorageService implements StorageService {
  final SharedPreferences _sharedPreferences;

  SharedPrefsStorageService(this._sharedPreferences);

  @override
  Future<bool> contains(String key) async {
    return _sharedPreferences.containsKey(key);
  }

  @override
  Future<String?> getString(String key) async {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> saveString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }

  @override
  Future<bool> saveBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }

  @override
  Future<bool> saveInt(String key, int value) async {
    return await _sharedPreferences.setInt(key, value);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return _sharedPreferences.getStringList(key);
  }

  @override
  Future<bool> saveStringList(String key, List<String> value) async {
    return await _sharedPreferences.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

  @override
  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  @override
  Future<Map<String, String>?> getMap(String key) async {
    final value = _sharedPreferences.getString(key);
    if (value == null) return null;
    return Map<String, String>.from(jsonDecode(value));
  }

  @override
  Future<bool> saveMap(String key, Map<String, String> value) async {
    return await _sharedPreferences.setString(key, jsonEncode(value));
  }
}
