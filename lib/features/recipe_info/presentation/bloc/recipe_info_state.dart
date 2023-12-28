part of 'recipe_info_bloc.dart';

@immutable
abstract class RecipeInfoState {}

class RecipeInfoInitialState extends RecipeInfoState {}

class RecipeInfoLoadingState extends RecipeInfoState {}

class RecipeInfoSuccessState extends RecipeInfoState {
  final RecipeInfoModel recipe;
  final List<Similar> similar;
  final List<Equipment> equipment;
  final Nutrient nutrient;

  RecipeInfoSuccessState({
    required this.recipe,
    required this.nutrient,
    required this.similar,
    required this.equipment,
  });
}

class RecipeInfoFailureState extends RecipeInfoState {
  final String message;

  RecipeInfoFailureState({required this.message});
}
