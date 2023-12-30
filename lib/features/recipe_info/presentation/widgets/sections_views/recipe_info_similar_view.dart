import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/models/recipe/similar_list.dart';
import '../recipe_info_similar_card.dart';

class RecipeInfoSimilarView extends StatelessWidget {
  const RecipeInfoSimilarView({
    super.key,
    required this.similarList,
  });

  final List<SimilarModel> similarList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return RecipeInfoSimilarCard(items: similarList[index]);
        },
        separatorBuilder: (context, index) {
          return const Gap(15);
        },
        itemCount: similarList.length,
      ),
    );
  }
}
