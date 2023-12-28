import 'package:flutter/material.dart';

import '../../data/models/home_body_model.dart';
import 'home_horizontal_section.dart';
import 'home_vertical_section.dart';

class HomeSections extends StatelessWidget {
  const HomeSections({
    super.key,
    required this.homeBodyModel,
  });

  final HomeBodyModel homeBodyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHorizontalSection(
          headerText: "Popular Breakfast Recipes",
          typeName: "breakfast",
          items: homeBodyModel.breakfast,
        ),
        HomeVerticalSection(
          headerText: "Best Lunch Recipes",
          typeName: "lunch",
          items: homeBodyModel.lunch,
        ),
        HomeHorizontalSection(
          headerText: "Popular Drinks",
          typeName: "drinks",
          items: homeBodyModel.drinks,
        ),
        HomeVerticalSection(
          headerText: "Best Burgers Recipes",
          typeName: "burgers",
          items: homeBodyModel.burgers,
        ),
        HomeHorizontalSection(
          headerText: "Pizza",
          typeName: "pizza",
          items: homeBodyModel.pizza,
        ),
        HomeVerticalSection(
          headerText: "Wants Best Cake",
          typeName: "cake",
          items: homeBodyModel.cake,
        ),
      ],
    );
  }
}
