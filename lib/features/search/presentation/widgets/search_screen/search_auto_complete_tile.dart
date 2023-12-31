import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_navigator.dart';
import 'package:meal_snap/core/utils/app_routes.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            offset: Offset(-2, -2),
            blurRadius: 12,
            color: Color.fromRGBO(0, 0, 0, 0.05),
          ),
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 5,
            color: Color.fromRGBO(0, 0, 0, 0.10),
          )
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
          onTap: () {
            AppNavigator.pushNamed(
              Routes.recipeInfoScreen,
              arguments: RecipeInfoScreenArguments(id: item.id),
            );
          },
          leading: Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(item.image))),
          ),
          title: Text(
            item.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
