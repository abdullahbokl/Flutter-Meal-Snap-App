import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_snap/core/utils/app_styles.dart';
import 'package:meal_snap/features/recipe_info/presentation/widgets/recipe_info_section_list.dart';
import 'package:meal_snap/features/recipe_info/presentation/widgets/sections_views/recipe_info_instructions_view.dart';
import 'package:meal_snap/features/recipe_info/presentation/widgets/sections_views/recipe_info_nutrients_view.dart';
import 'package:meal_snap/features/recipe_info/presentation/widgets/sections_views/recipe_info_summary_view.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/enums.dart';
import 'sections_views/recipe_info_similar_view.dart';

class RecipeInfoSection extends StatelessWidget {
  const RecipeInfoSection({
    super.key,
    required this.title,
    required this.data,
    required this.dataKey,
  });

  final String title;
  final dynamic data;

  final RecipeInfoArgumentsKeys dataKey;

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
        const Gap(20),
        DelayedDisplay(
          delay: const Duration(microseconds: 600),
          child: LayoutBuilder(
            builder: (context, constraints) {
              switch (dataKey) {
                case RecipeInfoArgumentsKeys.ingredients:
                case RecipeInfoArgumentsKeys.equipments:
                  return RecipeInfoSectionList(
                    data: data,
                    dataKey: dataKey,
                  );

                case RecipeInfoArgumentsKeys.instructions:
                  return RecipeInfoInstructionsView(instructions: data);
                case RecipeInfoArgumentsKeys.summary:
                  return RecipeInfoSummaryView(summary: data);
                case RecipeInfoArgumentsKeys.nutrients:
                  return RecipeInfoNutrientsView(nutrientModel: data);
                case RecipeInfoArgumentsKeys.similar:
                  return RecipeInfoSimilarView(similarList: data);

                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
