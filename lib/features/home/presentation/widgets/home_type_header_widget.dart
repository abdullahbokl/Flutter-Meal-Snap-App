import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_routes.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../search/data/models/search_results_screen_arguments.dart';

class HomeTypeHeaderWidget extends StatelessWidget {
  const HomeTypeHeaderWidget({
    super.key,
    required this.headerText,
    required this.typeName,
  });

  final String headerText;
  final String typeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DelayedDisplay(
            delay: const Duration(microseconds: 600),
            child: Text(
              headerText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
        IconButton(
          onPressed: () {
            AppNavigator.pushNamed(
              Routes.searchResultsScreen,
              arguments: SearchResultsScreenArguments(
                typeName: typeName,
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_forward_sharp,
          ),
        ),
      ],
    );
  }
}
