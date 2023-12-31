import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../errors/cache_exceptions.dart';
import 'cache_services.dart';

class HiveConsumer extends CacheServices {
  @override
  dynamic saveData({
    required String boxName,
    required String key,
    required value,
  }) {
    try {
      final box = Hive.box(boxName);
      box.put(key, value);
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(
        'Error while saving data to hive : $e',
      );
    }
  }

  @override
  getData({
    required String key,
    required String boxName,
  }) {
    try {
      final box = Hive.box(boxName);
      return box.get(key);
    } catch (e) {
      log("Error while getting data from hive : $e");
      throw CacheExceptions(
        'Error while getting data from hive : $e',
      );
    }
  }

  @override
  Future<void> removeData({
    required String key,
    required String boxName,
  }) {
    try {
      return Hive.deleteBoxFromDisk(key);
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(
        'Error while removing data from hive : $e',
      );
    }
  }

  @override
  void clearData() {
    try {
      Hive.deleteFromDisk();
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(
        'Error while clearing data from hive : $e',
      );
    }
  }
}
