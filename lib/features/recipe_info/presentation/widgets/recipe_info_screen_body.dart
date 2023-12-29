import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/widgets/custom_text_widget.dart';
import 'package:meal_snap/core/utils/app_styles.dart';
import 'package:meal_snap/features/recipe_info/presentation/widgets/recipe_info_status_card.dart';
import 'package:meal_snap/features/recipe_info/presentation/widgets/similar_list.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/widgets/custom_sliver_app_bar/custom_sliver_app_bar.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/models/recipe_info_screen_data_model.dart';
import 'nutrients.dart';
import 'recipe_info_section.dart';

class RecipeInfoScreenBody extends StatelessWidget {
  final RecipeInfoScreenModel dataModel;

  const RecipeInfoScreenBody({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // app bar
          SliverPersistentHeader(
            delegate: CustomSliverAppBar(
              expandedHeight: 300,
              info: dataModel.info,
            ),
            pinned: true,
          ),
          // title
          buildPaddedSliverWidget(
            child: CustomTextWidget(
              text: dataModel.info.title!,
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
              data: dataModel.info.extendedIngredients!,
            ),
            padding: const EdgeInsets.all(25.0),
          ),
          // instructions
          if (dataModel.info.instructions != null)
            buildPaddedSliverWidget(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Instructions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Html(
                  //   data: widget.info.instructions,
                  //   style: {
                  //     'p': Style(
                  //       fontSize: FontSize.large,
                  //       color: Colors.black,
                  //     ),
                  //   },
                  // ),
                ],
              ),
              padding: const EdgeInsets.all(26.0),
            ),
          // equipments
          buildPaddedSliverWidget(
            child: RecipeInfoSection(
              title: AppStrings.recipeInfoScreenModelEquipments,
              data: dataModel.equipment,
            ),

            // Column(
            //   children: [
            //     if (dataModel.equipment.isNotEmpty)
            //       Text(
            //         "Equipments",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //         ),
            //       ),
            //     if (dataModel.equipment.isNotEmpty)
            //       EquipmentsListView(
            //         equipments: dataModel.equipment,
            //       ),
            //     // todo : RecipeInfoHorizontalListView
            //   ],
            // ),
            padding: const EdgeInsets.all(26.0),
          ),
          // summary
          if (dataModel.info.summary != null)
            buildPaddedSliverWidget(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quick summary",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Html(
                  //   data: widget.info.summary,
                  // ),
                ],
              ),
              padding: const EdgeInsets.all(26.0),
            ),
          // nutrients
          buildPaddedSliverWidget(
            child: Column(
              children: [
                NutrientsWidgets(
                  nutrient: dataModel.nutrient,
                ),
                NutrientsbadWidget(
                  nutrient: dataModel.nutrient,
                ),
                NutrientsgoodWidget(
                  nutrient: dataModel.nutrient,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // similar
          buildPaddedSliverWidget(
            child: Column(
              children: [
                if (dataModel.similarList.isNotEmpty)
                  Text(
                    "Similar items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                if (dataModel.similarList.isNotEmpty)
                  SimilarListWidget(items: dataModel.similarList),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 26),
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
