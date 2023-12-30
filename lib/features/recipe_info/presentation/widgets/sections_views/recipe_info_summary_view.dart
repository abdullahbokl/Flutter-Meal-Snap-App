import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_scrollable_html_text.dart';

class RecipeInfoSummaryView extends StatelessWidget {
  const RecipeInfoSummaryView({
    super.key,
    required this.summary,
  });

  final String summary;

  @override
  Widget build(BuildContext context) {
    return CustomScrollableHtmlText(htmlString: summary);
  }
}
