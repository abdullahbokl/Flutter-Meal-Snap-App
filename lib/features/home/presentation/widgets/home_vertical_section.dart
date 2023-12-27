import 'package:flutter/material.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../widgets/home_type_header_widget.dart';
import '../widgets/list_items.dart';

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
        ...items.map((meal) {
          return ListItem(
            foodTypeModel: meal,
          );
        }).toList(),
      ],
    );
  }
}
