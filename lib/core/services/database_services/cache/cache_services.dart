abstract class CacheServices {
  dynamic saveData({
    required String boxName,
    required String key,
    required dynamic value,
  });

  dynamic getData({
    required String boxName,
    required String key,
  });

  dynamic removeData({
    required String boxName,
    required String key,
  });

  dynamic clearData();
}
