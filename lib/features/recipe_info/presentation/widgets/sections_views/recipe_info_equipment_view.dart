import 'package:flutter/material.dart';

import '../../../../../core/common/models/recipe/equipment.dart';
import '../../../../../core/utils/app_strings.dart';
import '../recipe_info_item_card.dart';

class RecipeInfoEquipmentView extends StatelessWidget {
  const RecipeInfoEquipmentView({
    super.key,
    required this.equipment,
  });

  final EquipmentModel equipment;

  @override
  Widget build(BuildContext context) {
    return RecipeInfoItemCard(
      name: equipment.name!,
      imageUrl: "${AppStrings.recipeInfoEquipmentImageUrl}${equipment.image}",
    );
  }
}
