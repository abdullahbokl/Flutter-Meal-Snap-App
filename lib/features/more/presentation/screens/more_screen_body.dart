import 'package:flutter/material.dart';
import 'package:meal_snap/core/services/database_services/cache/cache_services.dart';
import 'package:meal_snap/core/utils/app_colors.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_routes.dart';
import 'package:meal_snap/core/utils/app_strings.dart';
import 'package:meal_snap/features/more/presentation/widget/more_app_features.dart';
import 'package:meal_snap/features/more/presentation/widget/more_app_info.dart';

import '../../../../core/utils/service_locator.dart';
import '../widget/more_terms_of_use.dart';

class MoreScreenBody extends StatelessWidget {
  const MoreScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final appBarHeight = MediaQuery.of(context).padding.top;
        final bottomNavBarHeight = MediaQuery.of(context).padding.bottom;
        final double height =
            constraints.maxHeight - appBarHeight - bottomNavBarHeight;
        return SingleChildScrollView(
          child: Container(
            height: height - 20,
            color: AppColors.white,
            child: const Column(
              children: [
                MoreTermsOfUse(),
                MoreAppFeatures(),
                MoreAppInfo(),
                Spacer(),
                SignOutButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () async {
          await getIt<CacheServices>().removeBox(
            boxName: AppStrings.hiveLoginBox,
          );
          AppNavigator.removeAllAndPushNamed(Routes.loginScreen);
        },
        // color
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(200, 50),
        ),
        child: const Text(AppStrings.signOut),
      ),
    );
  }
}
