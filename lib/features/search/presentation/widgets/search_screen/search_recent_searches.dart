import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/widgets/custom_text_widget.dart';

import '../../../../../core/common/widgets/custom_chip_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

// "Recent searches by people",
class SearchRecentSearches extends StatelessWidget {
  const SearchRecentSearches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: AppStrings.recentSearchesByPeople,
          style: AppStyles.font20SatoshiW500.copyWith(
            color: Colors.black,
          ),
        ),
        const Wrap(
          alignment: WrapAlignment.start,
          children: [
            ChipWidget(AppStrings.baking),
            ChipWidget(AppStrings.vegetarian),
            ChipWidget(AppStrings.sauces),
            ChipWidget(AppStrings.meat),
            ChipWidget(AppStrings.turkey),
            ChipWidget(AppStrings.chicken),
            ChipWidget(AppStrings.sausages),
            ChipWidget(AppStrings.mince),
            ChipWidget(AppStrings.burgers),
            ChipWidget(AppStrings.pasta),
            ChipWidget(AppStrings.noodles),
            ChipWidget(AppStrings.pizza),
            ChipWidget(AppStrings.soups),
          ],
        ),
      ],
    );
  }
}
