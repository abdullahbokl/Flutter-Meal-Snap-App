import 'package:flutter/material.dart';

import '../../../../../core/common/models/recipe/similar_list.dart';
import '../similar_list.dart';

class RecipeInfoSimilarView extends StatelessWidget {
  const RecipeInfoSimilarView({
    super.key,
    required this.similarList,
  });

  final List<SimilarModel> similarList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (similarList.isNotEmpty)
          const Text(
            "Similar items",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        if (similarList.isNotEmpty) SimilarListWidget(items: similarList),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
