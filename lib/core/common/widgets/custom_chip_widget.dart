import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/widgets/custom_text_widget.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_routes.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../features/search/data/models/search_results_screen_arguments.dart';

class ChipWidget extends StatelessWidget {
  final String text;

  const ChipWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DelayedDisplay(
        delay: const Duration(microseconds: 600),
        child: InkWell(
          onTap: () {
            AppNavigator.pushNamed(
              Routes.searchResultsScreen,
              arguments: SearchResultsScreenArguments(
                typeName: text,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, -2),
                  blurRadius: 5,
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                ),
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  color: Color.fromRGBO(0, 0, 0, 0.10),
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: CustomTextWidget(
                text: text,
                style: AppStyles.font16SatoshiBold.copyWith(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
