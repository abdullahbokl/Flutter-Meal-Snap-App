import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_strings.dart';

import '../../../../core/common/widgets/custom_expandable_group.dart';

class MoreAppFeatures extends StatelessWidget {
  const MoreAppFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpandableGroup(
      isExpanded: false,
      collapsedIcon: const Icon(Icons.arrow_drop_down),
      header: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          AppStrings.features,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      items: const [
        ListTile(
          title: Text(
            AppStrings.feature1,
          ),
        ),
        ListTile(
          title: Text(
            AppStrings.feature2,
          ),
        ),
        ListTile(
          title: Text(
            AppStrings.feature3,
          ),
        ),
        // fav
        ListTile(
          title: Text(
            AppStrings.feature4,
          ),
        ),
        ListTile(
          title: Text(
            AppStrings.feature5,
          ),
        ),
      ],
    );
  }
}
