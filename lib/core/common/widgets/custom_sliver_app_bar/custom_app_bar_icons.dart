import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

import '../../../utils/app_navigator.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../animation/animation.dart';
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
                const url = "";
                Share.share(
                  'check out This tasty recipe $url',
                );
              },
            ),
          )!,
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Opacity(
          opacity: (0 + shrinkOffset / expandedHeight),
          child: Container(
            height: 59.7.h,
            decoration: BoxDecoration(
              boxShadow: kElevationToShadow[1],
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: appBarOpacity == 0
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (appBarOpacity == 0)
                  DelayedDisplay(
                    child: CustomRoundedButton(
                      icon: Icons.arrow_back,
                      onTap: () => AppNavigator.pop(),
                    ),
                  ),
                const CustomTextWidget(
                  text: AppStrings.appName,
                  style: AppStyles.font24TelmaBold,
                ),
                if (appBarOpacity == 0)
                  DelayedDisplay(
                    child: CustomRoundedButton(
                      icon: Icons.share,
                      onTap: () {
                        const url = "";
                        Share.share(
                          'check out This tasty recipe $url',
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
