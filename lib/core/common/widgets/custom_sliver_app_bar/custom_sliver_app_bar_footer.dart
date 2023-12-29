import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../animation/animation.dart';
import '../../models/recipe/recipe_model.dart';
import '../custom_text_widget.dart';
import 'custom_favorite_button.dart';

class CustomSliverAppBarFooter extends StatelessWidget {
  const CustomSliverAppBarFooter({
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
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: DelayedDisplay(
            delay: const Duration(microseconds: 600),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[1],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CustomTextWidget(
                        text: info.spoonacularScore?.toStringAsFixed(2) ?? "0",
                        style: AppStyles.font12SatoshiW100.copyWith(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Gap(10),
                      Icon(
                        Icons.star_outlined,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
                CustomFavoriteButton(info: info)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
