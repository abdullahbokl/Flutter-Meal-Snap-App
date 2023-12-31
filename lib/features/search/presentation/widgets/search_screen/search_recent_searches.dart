import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_chip_widget.dart';

class SearchRecentSearches extends StatelessWidget {
  const SearchRecentSearches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Text(
            "Recent searches by people",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              ChipWidget("Baking"),
              ChipWidget("Vegetarian"),
              ChipWidget("Sauces"),
              ChipWidget("Meat"),
              ChipWidget("Turkey"),
              ChipWidget("Chicken"),
              ChipWidget("Sausages"),
              ChipWidget("Mince"),
              ChipWidget("Burgers"),
              ChipWidget("Pasta"),
              ChipWidget("Noodles"),
              ChipWidget("Pizza"),
              ChipWidget("Soups"),
            ],
          ),
        ),
      ],
    );
  }
}
