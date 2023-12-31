import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'search_recent_searches.dart';
import 'search_recipes_by_categories.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0,
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: const [
          SearchRecentSearches(),
          Gap(20.0),
          SearchRecipesByCategories(),
        ],
      ),
    );
  }
}
