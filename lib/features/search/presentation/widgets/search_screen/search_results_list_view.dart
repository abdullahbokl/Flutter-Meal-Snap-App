import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../recipe_info/data/models/recipe_info_screen_arguments.dart';
import '../../../data/models/search_list_tile_model.dart';
import 'search_custom_list_tile.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({
    super.key,
    required this.searchList,
  });

  final List<SearchListTileModel> searchList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return SearchCustomListTile(
          item: searchList[index],
          onTap: () {
            AppNavigator.pushNamed(
              Routes.recipeInfoScreen,
              arguments: RecipeInfoScreenArguments(id: searchList[index].id),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Gap(10);
      },
      itemCount: searchList.length,
    );
  }
}
