import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';

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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: true,
      leading: CustomRoundedButton(
        icon: Icons.arrow_back,
        onTap: () {
          AppNavigator.pop();
        },
      ),
      actions: [
        CustomRoundedButton(
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
      ],
      title: Opacity(
        opacity: (0 + shrinkOffset / expandedHeight),
        child: const CustomTextWidget(
          text: "MealSnap",
          style: AppStyles.font24TelmaBold,
        ),
      ),
    );
  }
}
