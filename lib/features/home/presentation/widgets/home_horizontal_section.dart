import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/models/food_type_model.dart';
import '../widgets/home_horizontal_food_list.dart';
import '../widgets/home_type_header_widget.dart';

class HomeHorizontalSection extends StatelessWidget {
  const HomeHorizontalSection({
    Key? key,
    required this.headerText,
    required this.typeName,
    required this.items,
  }) : super(key: key);

  final String headerText;
  final String typeName;
  final List<FoodTypeModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTypeHeaderWidget(
          headerText: headerText,
          typeName: typeName,
        ),
        const SizedBox(height: 10),
        const Gap(10),
        DelayedDisplay(
          delay: const Duration(microseconds: 600),
          child: HomeHorizontalFoodList(items: items),
        ),
      ],
    );
  }
}
