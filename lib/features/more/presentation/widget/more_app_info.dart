import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_strings.dart';

import '../../../../core/common/functions/url_launcher.dart';
import '../../../../core/common/widgets/custom_expandable_group.dart';

class MoreAppInfo extends StatelessWidget {
  const MoreAppInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpandableGroup(
      isExpanded: false,
      collapsedIcon: Icon(Icons.arrow_drop_down),
      header: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          AppStrings.appInformation,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      items: [
        ListTile(
          onTap: () {
            launchUrlMethod("https://github.com/abdullahbokl");
          },
          title: const Text(AppStrings.sourceCode,
              style: TextStyle(color: Colors.blue)),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo1),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo2),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo3),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo4),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo5),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo6),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo7),
        ),
        const ListTile(
          title: Text(AppStrings.appInfo8),
        ),
        ListTile(
          onTap: () {
            launchUrlMethod("https://spoonacular.com/food-api");
          },
          title: const Text('with open source spoonacular api',
              style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
