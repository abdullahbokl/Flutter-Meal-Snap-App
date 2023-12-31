import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_strings.dart';

import 'search_category_tile.dart';
import 'search_recent_searches.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: const [
        SearchRecentSearches(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Text(
            AppStrings.searchRecipesByCategories,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        CategoryTile(
            text: "main course",
            image:
                "https://images.unsplash.com/photo-1559847844-5315695dadae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=740&q=80"),
        CategoryTile(
            text: "side dish",
            image:
                "https://images.unsplash.com/photo-1534938665420-4193effeacc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80"),
        CategoryTile(
            text: "dessert",
            image:
                "https://images.unsplash.com/photo-1587314168485-3236d6710814?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=670&q=80"),
        CategoryTile(
            text: "appetizer",
            image:
                "https://images.unsplash.com/photo-1541529086526-db283c563270?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
        CategoryTile(
          text: "salad",
          image:
              "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
        ),
        CategoryTile(
          text: "bread",
          image:
              "https://images.unsplash.com/photo-1509440159596-0249088772ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
        ),
        CategoryTile(
          text: "breakfast",
          image:
              "https://images.unsplash.com/photo-1525351484163-7529414344d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
        ),
        CategoryTile(
          text: "soup",
          image:
              "https://images.unsplash.com/photo-1547592166-23ac45744acd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80",
        ),
        CategoryTile(
          text: "beverage",
          image:
              "https://images.unsplash.com/photo-1595981267035-7b04ca84a82d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        ),
        CategoryTile(
          text: "sauce",
          image:
              "https://images.unsplash.com/photo-1472476443507-c7a5948772fc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        ),
        CategoryTile(
          text: "marinade",
          image:
              "https://images.unsplash.com/photo-1598511757337-fe2cafc31ba0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        ),
        CategoryTile(
          text: "fingerfood",
          image:
              "https://images.unsplash.com/photo-1605333396915-47ed6b68a00e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        ),
        CategoryTile(
          text: "snack",
          image:
              "https://images.unsplash.com/photo-1599490659213-e2b9527bd087?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        ),
        CategoryTile(
          text: "drink",
          image:
              "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
        ),
      ],
    );
  }
}
