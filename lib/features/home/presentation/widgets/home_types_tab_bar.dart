import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_chip_widget.dart';

class HomeTypesTabBar extends StatelessWidget {
  const HomeTypesTabBar({Key? key}) : super(key: key);
  final List<Widget> _types = const [
    SizedBox(width: 10),
    ChipWidget("Drinks"),
    ChipWidget("Baking"),
    ChipWidget("Desserts"),
    ChipWidget("Vegetarian"),
    ChipWidget("Sauces"),
    ChipWidget("Stir Fry"),
    ChipWidget("Seafood"),
    ChipWidget("Meat"),
    ChipWidget("Lamb"),
    ChipWidget("Pork"),
    ChipWidget("Poultry"),
    ChipWidget("Duck"),
    ChipWidget("Turkey"),
    ChipWidget("Chicken"),
    ChipWidget("Sausages"),
    ChipWidget("Mince"),
    ChipWidget("Burgers"),
    ChipWidget("Pies"),
    ChipWidget("Pasta"),
    ChipWidget("Noodles"),
    ChipWidget("Rice"),
    ChipWidget("Pizza"),
    ChipWidget("Sides"),
    ChipWidget("Salads"),
    ChipWidget("Soups"),
    ChipWidget("Snacks"),
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
