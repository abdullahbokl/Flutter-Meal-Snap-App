import 'dart:developer';

import 'package:meal_snap/core/errors/cache_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  final SharedPreferences _sharedPreferences;

  CacheServices(this._sharedPreferences);

  Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value is String) {
        await _sharedPreferences.setString(key, value);
      } else if (value is int) {
        await _sharedPreferences.setInt(key, value);
      } else if (value is bool) {
        await _sharedPreferences.setBool(key, value);
      } else if (value is double) {
        await _sharedPreferences.setDouble(key, value);
      } else if (value is List<String>) {
        await _sharedPreferences.setStringList(key, value);
      } else {
        throw CacheExceptions('Unknown value type');
      }
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(e.toString());
    }
  }

  dynamic getData({required String key}) {
    try {
      return _sharedPreferences.get(key);
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(e.toString());
    }
  }

  Future<void> removeData({required String key}) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(e.toString());
    }
  }

  Future<void> clearData() async {
    try {
      await _sharedPreferences.clear();
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(e.toString());
    }
  }
}
