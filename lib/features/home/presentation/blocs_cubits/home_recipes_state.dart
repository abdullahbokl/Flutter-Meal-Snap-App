part of 'home_recipes_bloc.dart';

@immutable
abstract class HomeRecipesState {}

class HomeRecipesInitial extends HomeRecipesState {}

class HomeRecipesLoading extends HomeRecipesState {}

class HomeRecipesSuccess extends HomeRecipesState {
  final List<FoodTypeModel> breakfast;
  final List<FoodTypeModel> lunch;
  final List<FoodTypeModel> drinks;
  final List<FoodTypeModel> burgers;
  final List<FoodTypeModel> pizza;
  final List<FoodTypeModel> cake;
  final List<FoodTypeModel> rice;

  HomeRecipesSuccess({
    required this.breakfast,
    required this.lunch,
    required this.drinks,
    required this.burgers,
    required this.pizza,
    required this.cake,
    required this.rice,
  });
}

class HomeRecipesError extends HomeRecipesState {}

class HomeFailureState extends HomeRecipesState {
  final String error;

  HomeFailureState({required this.error});
}
