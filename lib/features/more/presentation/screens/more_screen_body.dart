import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_colors.dart';
import 'package:meal_snap/core/utils/app_strings.dart';
import 'package:meal_snap/features/more/presentation/widget/more_app_features.dart';
import 'package:meal_snap/features/more/presentation/widget/more_app_info.dart';

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
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(AppStrings.signOut),
        // color
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(200, 50),
        ),
      ),
    );
  }
}
