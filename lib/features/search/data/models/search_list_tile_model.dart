import 'package:meal_snap/core/utils/app_strings.dart';

class SearchListTileModel {
  final String id;
  final String name;
  final String image;

  SearchListTileModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory SearchListTileModel.fromJson(json) {
    return SearchListTileModel(
      id: json[AppStrings.searchAutoCompleteModelId].toString(),
      name: json[AppStrings.searchAutoCompleteModelName],
      // image: json[searchAutoCompleteModelImage],
      image:
          "https://spoonacular.com/recipeImages/${json[AppStrings.searchAutoCompleteModelId]}-556x370.${json[AppStrings.searchAutoCompleteModelImageType]}",
    );
  }
}
