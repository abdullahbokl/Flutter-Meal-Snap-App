import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/custom_search_field.dart';
import '../../data/models/home_body_model.dart';
import '../widgets/home_types_tab_bar.dart';
import 'home_custom_message_widget.dart';
import 'home_horizontal_section.dart';
import 'home_vertical_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
    required this.homeBodyModel,
  }) : super(key: key);

  final HomeBodyModel homeBodyModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Gap(30),
          const HomeCustomMessageWidget(),
          const Gap(20),
          const HomeTypesTabBar(),
          const Gap(10),
          CustomSearchField(onSubmitted: () {}),
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
      ),
    );
  }
}
