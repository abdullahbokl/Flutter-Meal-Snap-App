import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/recipe_info/data/models/recipe_info_screen_arguments.dart';
import '../../utils/app_navigator.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_styles.dart';
import '../models/food_type_model.dart';
import 'custom_loading_indicator.dart';
import 'custom_text_widget.dart';

class CustomRecipeCard extends StatelessWidget {
  const CustomRecipeCard({
    super.key,
    required this.item,
  });

  final FoodTypeModel item;

  @override
  Widget build(BuildContext context) {
    final isReadyIn = item.readyInMinutes != null;
    return InkWell(
      onTap: () {
        AppNavigator.pushNamed(
          Routes.recipeInfoScreen,
          arguments: RecipeInfoScreenArguments(id: item.id),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: AppStyles.primaryBoxDecoration,
        width: 190.w,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.image,
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
                if (!isReadyIn) const Spacer(),
                // details
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      CustomTextWidget(
                        text: item.name,
                        style: AppStyles.font16SatoshiBold.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (isReadyIn) ...[
                        const Spacer(),
                        // ready in
                        CustomTextWidget(
                          text: "Ready in ${item.readyInMinutes} Min",
                          style: AppStyles.font16SatoshiBold.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ],
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
