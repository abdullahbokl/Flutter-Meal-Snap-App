import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/enums.dart';
import 'sections_views/recipe_info_equipment_view.dart';
import 'sections_views/recipe_info_ingredient_view.dart';

class RecipeInfoSectionList extends StatelessWidget {
  const RecipeInfoSectionList({
    super.key,
    required this.data,
    required this.dataKey,
  });

  final dynamic data;
  final RecipeInfoArgumentsKeys dataKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          switch (dataKey) {
            case RecipeInfoArgumentsKeys.ingredients:
              return RecipeInfoIngredientView(
                ingredient: data[index],
              );
            case RecipeInfoArgumentsKeys.equipments:
              return RecipeInfoEquipmentView(
                equipment: data[index],
              );

            default:
              return const SizedBox.shrink();
          }
        },
        separatorBuilder: (context, index) {
          return const Gap(10);
        },
        itemCount: (data as List).length,
      ),
    );
  }
}
