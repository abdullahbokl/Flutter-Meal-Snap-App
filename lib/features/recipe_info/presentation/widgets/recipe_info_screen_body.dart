import 'package:flutter/material.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/enums.dart';
import '../../../../core/common/widgets/custom_sliver_app_bar/custom_sliver_app_bar.dart';
import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/recipe_info_screen_data_model.dart';
import 'recipe_info_section.dart';
import 'recipe_info_status_card.dart';

class RecipeInfoScreenBody extends StatelessWidget {
  final RecipeInfoScreenModel dataModel;

  const RecipeInfoScreenBody({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // app bar
          SliverPersistentHeader(
            delegate: CustomSliverAppBar(
              expandedHeight: 300,
              info: dataModel.recipeInfoModel,
            ),
            pinned: true,
          ),
          // title
          buildPaddedSliverWidget(
            child: CustomTextWidget(
              text: dataModel.recipeInfoModel.title!,
              style: AppStyles.font24TelmaBold,
            ),
          ),
          // status card
          buildPaddedSliverWidget(
            child: RecipeInfoStatusCard(dataModel: dataModel),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          ),
          // ingredients
          buildPaddedSliverWidget(
            child: RecipeInfoSection(
              title: AppStrings.recipeInfoScreenModelIngredients,
              data: dataModel.recipeInfoModel.extendedIngredients!,
              dataKey: RecipeInfoArgumentsKeys.ingredients,
            ),
          ),
          // instructions
          if (dataModel.recipeInfoModel.instructions != null)
            buildPaddedSliverWidget(
              child: RecipeInfoSection(
                title: AppStrings.recipeInfoInstructions,
                data: dataModel.recipeInfoModel.instructions!,
                dataKey: RecipeInfoArgumentsKeys.instructions,
              ),
            ),
          // equipments
          buildPaddedSliverWidget(
            child: RecipeInfoSection(
              title: AppStrings.recipeInfoScreenModelEquipments,
              data: dataModel.equipmentsList,
              dataKey: RecipeInfoArgumentsKeys.equipments,
            ),
          ),
          // summary
          if (dataModel.recipeInfoModel.summary != null)
            buildPaddedSliverWidget(
              child: RecipeInfoSection(
                title: AppStrings.recipeInfoSummary,
                data: dataModel.recipeInfoModel.summary!,
                dataKey: RecipeInfoArgumentsKeys.summary,
              ),
            ),
          // nutrients
          buildPaddedSliverWidget(
            child: RecipeInfoSection(
              title: AppStrings.recipeInfoNutrients,
              data: dataModel.nutrientModel,
              dataKey: RecipeInfoArgumentsKeys.nutrients,
            ),
          ),
          // similar
          buildPaddedSliverWidget(
            child: RecipeInfoSection(
              title: AppStrings.recipeInfoSimilar,
              data: dataModel.similarList,
              dataKey: RecipeInfoArgumentsKeys.similar,
            ),
          ),
        ],
      ),
    );
  }
}

SliverToBoxAdapter buildPaddedSliverWidget({
  required Widget child,
  EdgeInsetsGeometry? padding,
}) {
  return SliverToBoxAdapter(
    child: DelayedDisplay(
      delay: const Duration(microseconds: 600),
      child: Container(
        padding: padding ?? const EdgeInsets.all(25),
        child: child,
      ),
    ),
  );
}
