import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/enums.dart';
import '../../../../core/utils/app_styles.dart';
import 'recipe_info_section_list.dart';
import 'sections_views/recipe_info_instructions_view.dart';
import 'sections_views/recipe_info_nutrients_view.dart';
import 'sections_views/recipe_info_similar_view.dart';
import 'sections_views/recipe_info_summary_view.dart';

class RecipeInfoSection extends StatelessWidget {
  const RecipeInfoSection({
    super.key,
    this.title,
    required this.data,
    required this.dataKey,
  });

  final String? title;
  final dynamic data;

  final RecipeInfoArgumentsKeys dataKey;

  @override
  Widget build(BuildContext context) {
    return data == null
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                DelayedDisplay(
                  delay: const Duration(microseconds: 700),
                  child: Text(
                    title!,
                    style: AppStyles.font20SatoshiW500.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Gap(20),
              ],
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
