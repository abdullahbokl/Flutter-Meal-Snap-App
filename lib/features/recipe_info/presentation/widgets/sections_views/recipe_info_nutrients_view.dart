import 'package:flutter/material.dart';

import '../../../../../core/common/models/recipe/nutrients.dart';
import '../nutrients.dart';

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
        NutrientsWidgets(
          nutrient: nutrientModel,
        ),
        NutrientsbadWidget(
          nutrient: nutrientModel,
        ),
        NutrientsgoodWidget(
          nutrient: nutrientModel,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
