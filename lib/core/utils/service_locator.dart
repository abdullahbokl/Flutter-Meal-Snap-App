import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_snap/core/blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/presentation/blocs_cubits/login_cubit/login_cubit.dart';
import '../services/database_services/api/api_services.dart';
import '../services/database_services/api/init_dio.dart';
import '../services/database_services/cache/cache_services.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // Data sources
  getIt
    ..registerLazySingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance())
    ..registerLazySingleton<Dio>(() => initDio());

  // wait for the shared preferences to be registered
  await getIt.isReady<SharedPreferences>().catchError((e) {
    log("Error while registering SharedPreferences $e");
  });

  // services
  getIt
    ..registerLazySingleton<CacheServices>(() => CacheServices(getIt()))
    ..registerLazySingleton<ApiServices>(() => DioConsumer(getIt()));

  // repositories
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl());

  // cubits
  getIt
    ..registerLazySingleton<AppLangCubit>(() => AppLangCubit())
    ..registerFactory(() => LoginCubit(getIt()));
}
