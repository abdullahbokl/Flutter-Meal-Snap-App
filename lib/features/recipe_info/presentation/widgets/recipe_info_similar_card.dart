import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/models/recipe/similar_list.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/recipe_info_screen_arguments.dart';

class RecipeInfoSimilarCard extends StatelessWidget {
  const RecipeInfoSimilarCard({
    super.key,
    required this.items,
  });

  final SimilarModel items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.pushNamed(
          Routes.recipeInfoScreen,
          arguments: RecipeInfoScreenArguments(id: items.id),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: AppStyles.primaryBoxDecoration,
        width: 190.w,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                // image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: items.image,
                    placeholder: (context, url) => const Center(
                      child: CustomLoadingIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.6,
                  ),
                ),
                // details
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        CustomTextWidget(
                          text: items.name,
                          style: AppStyles.font16SatoshiBold.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        // ready in
                        CustomTextWidget(
                          text: "Ready in ${items.readyInMinutes} Min",
                          style: AppStyles.font16SatoshiBold.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
