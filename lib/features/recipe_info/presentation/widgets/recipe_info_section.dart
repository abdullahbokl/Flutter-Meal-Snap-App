import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/models/recipe/equipment.dart';
import '../../../../core/common/models/recipe/extended_ingredient.dart';
import 'recipe_info_equipment_view.dart';
import 'recipe_info_ingredient_view.dart';

class RecipeInfoSection extends StatelessWidget {
  const RecipeInfoSection({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DelayedDisplay(
          delay: const Duration(microseconds: 700),
          child: Text(
            title,
            style: AppStyles.font20SatoshiW500.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        if ((data as List).isNotEmpty) ...[
          const Gap(10),
          DelayedDisplay(
            delay: const Duration(microseconds: 600),
            child: SizedBox(
              height: 170.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  switch (data.runtimeType) {
                    case const (List<ExtendedIngredient>):
                      return RecipeInfoIngredientView(
                        ingredient: data[index],
                      );
                    case const (List<Equipment>):
                      return RecipeInfoEquipmentView(
                        equipment: data[index],
                      );

                    default:
                      return const SizedBox();
                  }
                },
                separatorBuilder: (context, index) {
                  return const Gap(10);
                },
                itemCount: (data as List).length,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
