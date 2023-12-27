import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/models/food_type_model.dart';
import 'home_horizontal_food_list_card.dart';

class HomeHorizontalFoodList extends StatelessWidget {
  final List<FoodTypeModel> items;

  const HomeHorizontalFoodList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          const Gap(20),
          ...items.map((item) {
            return HomeHorizontalFoodListCard(items: item);
          }).toList()
        ],
      ),
    );
  }
}
