import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/models/food_type_model.dart';
import '../widgets/food_type_widget.dart';
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
  final List<FoodTypeModel> items; // Replace YourItemType with the actual type

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTypeHeaderWidget(
          headerText: headerText,
          typeName: typeName,
        ),
        const Gap(10),
        DelayedDisplay(
          delay: const Duration(microseconds: 600),
          child: FoodTypeWidget(items: items),
        ),
      ],
    );
  }
}
