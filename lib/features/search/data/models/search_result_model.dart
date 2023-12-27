import 'package:meal_snap/core/utils/app_strings.dart';

class SearchResultModel {
  final String id;
  final String name;
  final String image;

  SearchResultModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory SearchResultModel.fromJson(json) {
    return SearchResultModel(
      id: json[AppStrings.searchResultModelId].toString(),
      name: json[AppStrings.searchResultModelName],
      image: json[AppStrings.searchResultModelImage],
    );
  }
}
