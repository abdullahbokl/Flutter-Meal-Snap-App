import 'package:flutter/material.dart';
import 'package:meal_snap/core/services/database_services/cache/cache_services.dart';
import 'package:meal_snap/core/utils/app_colors.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_routes.dart';
import 'package:meal_snap/core/utils/app_strings.dart';

import '../../../../core/utils/service_locator.dart';

class MoreSignOutButton extends StatelessWidget {
  const MoreSignOutButton({super.key});

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
