import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
import 'core/utils/app_constants.dart';
import 'core/utils/app_navigator.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocBuilder<AppLangCubit, AppLangState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return MaterialApp(
            title: translate().app_appName,
            onGenerateRoute: AppRoutes.generateRoute,
            navigatorKey: AppNavigator.navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(
              getIt<AppLangCubit>().currentLocale.name,
            ),
          );
        },
      ),
    );
  }
}
