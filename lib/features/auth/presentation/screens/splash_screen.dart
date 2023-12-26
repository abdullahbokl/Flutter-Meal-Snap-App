import 'package:flutter/material.dart';

import '../../../../core/services/database_services/cache/cache_services.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/service_locator.dart';
import '../widgets/splash_screen/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateAfterThreeSeconds();
    super.initState();
  }

  void _navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (getIt<CacheServices>().getData(key: AppStrings.prefsToken) == null) {
        AppNavigator.pushReplacementNamed(Routes.loginScreen);
      } else {
        AppNavigator.pushReplacementNamed(Routes.navBarScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SplashScreenBody(),
    );
  }
}
