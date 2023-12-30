import 'package:flutter/material.dart';

import '../../../../../core/common/models/recipe/nutrients.dart';
import '../nutrients_widgets/nutrients_bad_widget.dart';
import '../nutrients_widgets/nutrients_good_widget.dart';
import '../nutrients_widgets/nutrients_widget.dart';

class RecipeInfoNutrientsView extends StatelessWidget {
  const RecipeInfoNutrientsView({
    super.key,
    required this.nutrientModel,
  });

  final NutrientModel nutrientModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NutrientsWidget(
          nutrient: nutrientModel,
        ),
        NutrientsGoodWidget(
          nutrient: nutrientModel,
        ),
        NutrientsBadWidget(
          nutrient: nutrientModel,
        ),
      ],
    );
  }
}
