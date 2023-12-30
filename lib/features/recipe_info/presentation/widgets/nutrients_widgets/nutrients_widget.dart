import 'package:flutter/material.dart';

import '../../../../../core/common/models/recipe/nutrients.dart';
import '../../../../../core/common/widgets/custom_expandable_group.dart';
import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import 'nutrients_list_tile.dart';

class NutrientsWidget extends StatelessWidget {
  final NutrientModel nutrient;

  const NutrientsWidget({
    super.key,
    required this.nutrient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: CustomExpandableGroup(
        isExpanded: false,
        collapsedIcon: const Icon(Icons.arrow_drop_down),
        header: CustomTextWidget(
          text: AppStrings.recipeInfoNutrients,
          style: AppStyles.font16SatoshiBold.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
        items: _items(),
      ),
    );
  }

  List<ListTile> _items() {
    return [
      nutrientsListTile(
        icon: Icons.fireplace,
        title: AppStrings.recipeInfoCalories,
        value: nutrient.calories,
      ),
      nutrientsListTile(
        icon: Icons.face_outlined,
        title: AppStrings.recipeInfoFat,
        value: nutrient.fat,
      ),
      nutrientsListTile(
        icon: Icons.bakery_dining,
        title: AppStrings.recipeInfoCarbohydrates,
        value: nutrient.carbs,
      ),
      nutrientsListTile(
        icon: Icons.bolt_outlined,
        title: AppStrings.recipeInfoProtein,
        value: nutrient.protein,
      ),
    ];
  }
}
