import 'package:meal_snap/core/utils/app_strings.dart';

class FoodType {
  final String id;
  final String name;
  final String image;
  final String readyInMinutes;
  final String servings;

  FoodType({
    required this.id,
    required this.name,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
  });

  factory FoodType.fromJson(json) {
    return FoodType(
      id: json[AppStrings.foodModelId].toString(),
      name: json[AppStrings.foodModelName] ?? '',
      image: json[AppStrings.foodModelImage] ?? '',
      readyInMinutes: json[AppStrings.foodModelReadyInMinutes].toString(),
      servings: json[AppStrings.foodModelServings].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.foodModelId: id,
      AppStrings.foodModelName: name,
      AppStrings.foodModelImage: image,
      AppStrings.foodModelReadyInMinutes: readyInMinutes,
      AppStrings.foodModelServings: servings,
    };
  }

  FoodType copyWith({
    String? id,
    String? name,
    String? image,
    String? readyInMinutes,
    String? servings,
  }) {
    return FoodType(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      servings: servings ?? this.servings,
    );
  }
}
