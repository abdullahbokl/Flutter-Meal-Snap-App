import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../../../../core/common/models/recipe/recipe_model.dart';
import '../../../../core/common/widgets/custom_food_list_card.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({
    super.key,
    required this.box,
  });

  final Box box;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, i) {
          final info = box.getAt(i);
          final data = RecipeInfoModel.fromJson(info);
          return CustomFoodListCard(
            foodTypeModel: FoodTypeModel(
              id: data.id.toString(),
              image: data.image!,
              name: data.title!,
              readyInMinutes: data.readyInMinutes.toString(),
              servings: data.servings.toString(),
            ),
          );
        },
        itemCount: box.length,
      ),
    );
  }
}
