import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

import '../../../../../core/common/models/recipe/nutrients.dart';
import '../../../../../core/common/widgets/custom_expandable_group.dart';
import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import 'nutrients_list_tile.dart';

class NutrientsGoodWidget extends StatelessWidget {
  final NutrientModel nutrient;

  const NutrientsGoodWidget({Key? key, required this.nutrient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: CustomExpandableGroup(
        isExpanded: false,
        collapsedIcon: const Icon(Icons.arrow_drop_down),
        header: CustomTextWidget(
          text: AppStrings.goodForHealthNutrients,
          style: AppStyles.font16SatoshiBold.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
        items: _items(),
      ),
    );
  }

  List<ListTile> _items() {
    return [
      ...nutrient.good.map((nutri) {
        return nutrientsGoodListTile(
          title: nutri.name,
          value: nutri.amount,
          percentOfDailyNeeds: nutri.percentOfDailyNeeds,
        );
      }).toList()
    ];
  }
}
