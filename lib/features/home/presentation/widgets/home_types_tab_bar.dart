import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_chip_widget.dart';
import '../../../../core/utils/app_strings.dart';

class HomeTypesTabBar extends StatelessWidget {
  const HomeTypesTabBar({Key? key}) : super(key: key);
  final List<Widget> _types = const [
    SizedBox(width: 10),
    ChipWidget(AppStrings.baking),
    ChipWidget(AppStrings.burgers),
    ChipWidget(AppStrings.chicken),
    ChipWidget(AppStrings.desserts),
    ChipWidget(AppStrings.duck),
    ChipWidget(AppStrings.drinks),
    ChipWidget(AppStrings.lamb),
    ChipWidget(AppStrings.meat),
    ChipWidget(AppStrings.mince),
    ChipWidget(AppStrings.noodles),
    ChipWidget(AppStrings.pasta),
    ChipWidget(AppStrings.pies),
    ChipWidget(AppStrings.pizza),
    ChipWidget(AppStrings.pork),
    ChipWidget(AppStrings.poultry),
    ChipWidget(AppStrings.rice),
    ChipWidget(AppStrings.salads),
    ChipWidget(AppStrings.sauces),
    ChipWidget(AppStrings.seafood),
    ChipWidget(AppStrings.sides),
    ChipWidget(AppStrings.snacks),
    ChipWidget(AppStrings.soups),
    ChipWidget(AppStrings.stirFry),
    ChipWidget(AppStrings.turkey),
    ChipWidget(AppStrings.vegetarian),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _types,
      ),
    );
  }
}
