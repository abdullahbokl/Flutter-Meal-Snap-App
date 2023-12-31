import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/search_list_tile_model.dart';
import '../../../data/models/search_results_screen_arguments.dart';
import 'search_custom_list_tile.dart';

class SearchRecipesByCategories extends StatelessWidget {
  const SearchRecipesByCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: AppStrings.searchRecipesByCategories,
          style: AppStyles.font20SatoshiW500.copyWith(
            color: Colors.black,
          ),
        ),
        const Gap(10),
        ...(items.map(
          (item) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: SearchCustomListTile(
                item: item,
                onTap: () {
                  AppNavigator.pushNamed(
                    Routes.searchResultsScreen,
                    arguments: SearchResultsScreenArguments(typeName: item.id),
                  );
                },
              ),
            );
          },
        )),
      ],
    );
  }
}

final List<SearchListTileModel> items = [
  SearchListTileModel(
    id: AppStrings.mainCourse,
    name: AppStrings.mainCourse,
    image:
        "https://images.unsplash.com/photo-1559847844-5315695dadae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=740&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.sideDish,
    name: AppStrings.sideDish,
    image:
        "https://images.unsplash.com/photo-1534938665420-4193effeacc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.dessert,
    name: AppStrings.dessert,
    image:
        "https://images.unsplash.com/photo-1587314168485-3236d6710814?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=670&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.appetizer,
    name: AppStrings.appetizer,
    image:
        "https://images.unsplash.com/photo-1541529086526-db283c563270?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.salad,
    name: AppStrings.salad,
    image:
        "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.bread,
    name: AppStrings.bread,
    image:
        "https://images.unsplash.com/photo-1509440159596-0249088772ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.breakfast,
    name: AppStrings.breakfast,
    image:
        "https://images.unsplash.com/photo-1525351484163-7529414344d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.soup,
    name: AppStrings.soup,
    image:
        "https://images.unsplash.com/photo-1547592166-23ac45744acd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.beverage,
    name: AppStrings.beverage,
    image:
        "https://images.unsplash.com/photo-1595981267035-7b04ca84a82d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.sauce,
    name: AppStrings.sauce,
    image:
        "https://images.unsplash.com/photo-1472476443507-c7a5948772fc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.marinade,
    name: AppStrings.marinade,
    image:
        "https://images.unsplash.com/photo-1598511757337-fe2cafc31ba0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.fingerFood,
    name: AppStrings.fingerFood,
    image:
        "https://images.unsplash.com/photo-1605333396915-47ed6b68a00e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.snack,
    name: AppStrings.snack,
    image:
        "https://images.unsplash.com/photo-1599490659213-e2b9527bd087?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  ),
  SearchListTileModel(
    id: AppStrings.drink,
    name: AppStrings.drink,
    image:
        "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
  ),
];
