import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../../../../core/common/widgets/custom_recipe_card.dart';

class HomeHorizontalFoodList extends StatelessWidget {
  final List<FoodTypeModel> items;

  const HomeHorizontalFoodList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomRecipeCard(item: items[index]);
        },
        separatorBuilder: (context, index) {
          return const Gap(15);
        },
        itemCount: items.length,
      ),
    );
  }
}
