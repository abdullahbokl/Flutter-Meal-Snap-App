import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_scrollable_html_text.dart';

class RecipeInfoInstructionsView extends StatelessWidget {
  const RecipeInfoInstructionsView({
    super.key,
    required this.instructions,
  });

  final String instructions;

  @override
  Widget build(BuildContext context) {
    return CustomScrollableHtmlText(htmlString: instructions);
  }
}
