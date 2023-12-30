import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:meal_snap/core/common/models/food_type_model.dart';

import '../../../../../core/common/models/recipe/similar_list.dart';
import '../../../../../core/common/widgets/custom_recipe_card.dart';

class RecipeInfoSimilarView extends StatelessWidget {
  const RecipeInfoSimilarView({
    super.key,
    required this.similarList,
  });

  final List<SimilarModel> similarList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomRecipeCard(
            item: FoodTypeModel(
              id: similarList[index].id,
              name: similarList[index].name,
              image: similarList[index].image,
              readyInMinutes: similarList[index].readyInMinutes,
              servings: similarList[index].servings,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Gap(15);
        },
        itemCount: similarList.length,
      ),
    );
  }
}
