import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (_sharedPreferences == null) {
      await init();
    }
    if (value is String) {
      await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences!.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences!.setStringList(key, value);
    } else {
      throw Exception('Unknown value type');
    }
  }

  static Future<dynamic> getData({required String key}) async {
    if (_sharedPreferences == null) {
      await init();
    }
    return _sharedPreferences!.get(key);
  }

  static Future<void> removeData({required String key}) async {
    if (_sharedPreferences == null) {
      await init();
    }
    await _sharedPreferences!.remove(key);
  }

  static Future<void> clearData() async {
    if (_sharedPreferences == null) {
      await init();
    }
    await _sharedPreferences!.clear();
  }
}
