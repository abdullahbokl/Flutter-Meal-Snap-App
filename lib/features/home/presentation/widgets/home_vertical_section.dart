import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../widgets/home_type_header_widget.dart';
import '../widgets/home_vertical_food_list_card.dart';

class HomeVerticalSection extends StatelessWidget {
  const HomeVerticalSection({
    super.key,
    required this.headerText,
    required this.typeName,
    required this.items,
  });

  final String headerText;
  final String typeName;
  final List<FoodTypeModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTypeHeaderWidget(
          headerText: headerText,
          typeName: typeName,
        ),
        ...items.sublist(0, min(3, items.length)).map((meal) {
          return HomeVerticalFoodListCard(
            foodTypeModel: meal,
          );
        }).toList(),
      ],
    );
  }
}
