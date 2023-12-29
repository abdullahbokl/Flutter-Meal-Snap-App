import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_strings.dart';

class RecipeInfoInstructionsView extends StatelessWidget {
  const RecipeInfoInstructionsView({
    super.key,
    required this.instructions,
  });

  final String instructions;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.recipeInfoInstructions,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Gap(20),
        // Html(
        //   data: widget.info.instructions,
        //   style: {
        //     'p': Style(
        //       fontSize: FontSize.large,
        //       color: Colors.black,
        //     ),
        //   },
        // ),
      ],
    );
  }
}
