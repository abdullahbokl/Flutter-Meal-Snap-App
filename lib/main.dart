import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'core/blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
import 'core/blocs_cubits/bloc_observer.dart';
import 'core/utils/app_constants.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/presentation/blocs_cubits/login_cubit/login_cubit.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _appInit();
  runApp(
    MultiBlocProvider(
      providers: _providers(),
      child: const MyApp(),
    ),
  );
}

List<SingleChildWidget> _providers() {
  return [
    BlocProvider<AppLangCubit>(
      create: (context) => getIt<AppLangCubit>(),
    ),
    BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
    ),
  ];
}

Future<void> _appInit() async {
  Bloc.observer = MyBlocObserver();
  await initServiceLocator();
  AppConstants.appLocalizations = await getIt<AppLangCubit>().initAppLocale();
}
