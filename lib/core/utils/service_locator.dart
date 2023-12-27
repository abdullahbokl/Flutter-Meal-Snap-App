import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_snap/features/search/data/repositories/search_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/presentation/blocs_cubits/login_cubit/login_cubit.dart';
import '../../features/home/data/repositories/home_recipes_repo.dart';
import '../../features/home/presentation/blocs_cubits/home_bloc.dart';
import '../../features/nav_bar/presentation/blocs_cubits/nav_bar_cubit.dart';
import '../../features/search/presentation/blocs_cubits/search_results_bloc/search_results_bloc.dart';
import '../blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
import '../services/database_services/api/api_services.dart';
import '../services/database_services/api/app_write/app_write_init.dart';
import '../services/database_services/api/app_write/app_write_services.dart';
import '../services/database_services/api/dio/auth_services.dart';
import '../services/database_services/api/dio/dio_init.dart';
import '../services/database_services/api/dio/dio_services.dart';
import '../services/database_services/cache/cache_services.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // App Write
  getIt
    ..registerLazySingleton<Client>(
      () => appWriteInit(),
    )
    ..registerLazySingleton<Account>(
      () => Account(getIt()),
    );

  // Data sources
  getIt
    ..registerLazySingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance())
    ..registerLazySingleton<Dio>(
      () => dioInit(),
    );

  // wait for the shared preferences to be registered
  await getIt.isReady<SharedPreferences>().catchError((e) {
    log("Error while registering SharedPreferences $e");
  });

  // services
  getIt
    ..registerLazySingleton<CacheServices>(
      () => CacheServices(getIt()),
    )
    ..registerLazySingleton<ApiServices>(
      () => DioServices(getIt()),
    )
    ..registerLazySingleton<AuthServices>(
      () => AppWriteServices(getIt()),
    );

  // repositories
  getIt
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(getIt()),
    )
    ..registerLazySingleton<HomeRecipesRepo>(
      () => HomeRecipesRepoImpl(getIt()),
    )
    ..registerLazySingleton<SearchRepo>(
      () => SearchRepoImpl(getIt()),
    );

  // cubits
  getIt
    ..registerLazySingleton<AppLangCubit>(
      () => AppLangCubit(),
    )
    ..registerLazySingleton<NavBarCubit>(
      () => NavBarCubit(),
    )
    ..registerLazySingleton<LoginCubit>(
      () => LoginCubit(),
    )
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(),
    )
    ..registerFactory<SearchResultsBloc>(
      () => SearchResultsBloc(),
    );
}
