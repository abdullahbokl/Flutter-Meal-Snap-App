import 'package:meal_snap/core/utils/app_strings.dart';

class SearchAutoCompleteModel {
  final String id;
  final String name;
  final String image;

  SearchAutoCompleteModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory SearchAutoCompleteModel.fromJson(json) {
    return SearchAutoCompleteModel(
      id: json[AppStrings.searchAutoCompleteModelId].toString(),
      name: json[AppStrings.searchAutoCompleteModelName],
      // image: json[searchAutoCompleteModelImage],
      image:
          "https://spoonacular.com/recipeImages/${json[AppStrings.searchAutoCompleteModelId]}-556x370.${json[AppStrings.searchAutoCompleteModelImageType]}",
    );
  }
}
