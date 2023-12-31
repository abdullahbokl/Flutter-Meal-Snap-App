import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/animation/animation.dart';
import 'package:meal_snap/core/utils/app_colors.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_routes.dart';

import '../widgets/change_lang_screen/change_lang_screen_body.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ChangeLangScreenBody(),
      floatingActionButton: DelayedDisplay(
        child: FloatingActionButton(
          onPressed: () => AppNavigator.pushNamed(Routes.loginScreen),
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
