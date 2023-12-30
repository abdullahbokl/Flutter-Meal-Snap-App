import 'package:flutter/material.dart';

import '../../../../../core/common/models/recipe/nutrients.dart';
import '../../../../../core/common/widgets/custom_expandable_group.dart';
import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import 'nutrients_list_tile.dart';

class NutrientsBadWidget extends StatelessWidget {
  final NutrientModel nutrient;

  const NutrientsBadWidget({
    super.key,
    required this.nutrient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: CustomExpandableGroup(
        isExpanded: false,
        collapsedIcon: const Icon(Icons.arrow_drop_down),
        header: CustomTextWidget(
          text: AppStrings.recipeInfoBadForHealthNutrients,
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
      ...nutrient.bad.map((nutri) {
        return nutrientsBadListTile(
          title: nutri.name,
          value: nutri.amount,
          percentOfDailyNeeds: nutri.percentOfDailyNeeds,
        );
      }).toList()
    ];
  }
}
