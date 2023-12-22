import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/database_services/api/api_services.dart';
import '../services/database_services/api/init_dio.dart';
import '../services/database_services/cache/cache_services.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // Shared Preferences
  getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
  await getIt.isReady<SharedPreferences>().catchError((e) {
    log("Error while registering SharedPreferences $e");
  });
  // Dio
  getIt.registerLazySingleton<Dio>(() => initDio());

  // services
  getIt.registerLazySingleton(() => CacheServices(getIt()));
  getIt.registerLazySingleton<ApiServices>(() => DioConsumer(getIt()));
}
