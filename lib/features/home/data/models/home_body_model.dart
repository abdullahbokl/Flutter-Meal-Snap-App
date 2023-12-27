import '../../../../core/common/models/food_type_model.dart';

class HomeBodyModel {
  final List<FoodTypeModel> breakfast;
  final List<FoodTypeModel> lunch;
  final List<FoodTypeModel> drinks;
  final List<FoodTypeModel> burgers;
  final List<FoodTypeModel> pizza;
  final List<FoodTypeModel> cake;
  final List<FoodTypeModel> rice;

  HomeBodyModel({
    required this.breakfast,
    required this.lunch,
    required this.drinks,
    required this.burgers,
    required this.pizza,
    required this.cake,
    required this.rice,
  });
}
