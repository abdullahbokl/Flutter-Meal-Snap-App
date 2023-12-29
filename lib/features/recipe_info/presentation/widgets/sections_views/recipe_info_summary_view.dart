import 'package:flutter/material.dart';

class RecipeInfoSummaryView extends StatelessWidget {
  const RecipeInfoSummaryView({
    super.key,
    required this.summary,
  });

  final String summary;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick summary",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        // Html(
        //   data: widget.info.summary,
        // ),
      ],
    );
  }
}
