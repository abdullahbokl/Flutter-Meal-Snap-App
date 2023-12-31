import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_strings.dart';

import '../../../utils/app_styles.dart';
import '../../models/recipe/recipe_model.dart';
import '../custom_text_widget.dart';
import 'custom_rounded_button.dart';

class CustomAppBarIcons extends StatelessWidget {
  const CustomAppBarIcons({
    super.key,
    required this.expandedHeight,
    required this.shrinkOffset,
    required this.info,
  });

  final double expandedHeight;
  final double shrinkOffset;
  final RecipeInfoModel info;

  double get appBarOpacity => (1 - shrinkOffset / expandedHeight);

  Widget? appBarWidgetsOpacity({
    required Widget child,
  }) {
    return appBarOpacity == 0
        ? null
        : Opacity(
            opacity: appBarOpacity,
            child: child,
          );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: appBarWidgetsOpacity(
          child: CustomRoundedButton(
            icon: Icons.arrow_back,
            onTap: () => AppNavigator.pop(),
          ),
        ),
        actions: [
          if (appBarOpacity != 0)
            appBarWidgetsOpacity(
              child: CustomRoundedButton(
                width: 40,
                icon: Icons.share,
                onTap: () {
                  // todo share link
                  // const url = "";
                  // Share.share(
                  //   'check out This tasty recipe $url',
                  // );
                },
              ),
            )!,
        ],
        // title: Opacity(
        //   opacity: (0 + shrinkOffset / expandedHeight),
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(
        //       vertical: 10,
        //       horizontal: 20,
        //     ),
        //     decoration: BoxDecoration(
        //       boxShadow: kElevationToShadow[1],
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     width: MediaQuery.of(context).size.width,
        //     child: const CustomTextWidget(
        //       text: AppStrings.appName,
        //       style: AppStyles.font24TelmaBold,
        //     ),
        //   ),
        // ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Opacity(
            opacity: (0 + shrinkOffset / expandedHeight),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[1],
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              child: const CustomTextWidget(
                text: AppStrings.appName,
                style: AppStyles.font24TelmaBold,
              ),
            ),
          ),
        ));
  }
}
