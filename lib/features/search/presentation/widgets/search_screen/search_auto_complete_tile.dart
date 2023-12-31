import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/widgets/custom_text_widget.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_routes.dart';
import 'package:meal_snap/core/utils/app_styles.dart';
import 'package:meal_snap/features/recipe_info/data/models/recipe_info_screen_arguments.dart';

import '../../../data/models/search_auto_complete_model.dart';

class SearchAutoCompleteTile extends StatelessWidget {
  final SearchAutoCompleteModel item;

  const SearchAutoCompleteTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: AppStyles.primaryBoxDecoration,
            child: ListTile(
              onTap: () {
                AppNavigator.pushNamed(
                  Routes.recipeInfoScreen,
                  arguments: RecipeInfoScreenArguments(id: item.id),
                );
              },
              leading: Container(
                  width: constraints.maxWidth * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(item.image),
                    ),
                  )),
              title: CustomTextWidget(
                text: item.name,
                style: AppStyles.font16SatoshiBold.copyWith(
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          );
        },
      ),
    );
  }
}
