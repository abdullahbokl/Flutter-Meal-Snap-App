import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/custom_image.dart';
import '../../../../core/services/database_services/cache/cache_services.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/service_locator.dart';

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
      getIt<CacheServices>().getData(key: AppStrings.apiToken) == null
          ? AppNavigator.pushNamed(Routes.changeLangScreen)
          : AppNavigator.pushNamed(Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imgPath: AppAssets.imagesLogo,
              h: 120.h,
              w: 120.w,
            ),
            const Gap(10),
            Text(
              "translate().app_appName",
              style: AppStyles.fontExtraBold(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
