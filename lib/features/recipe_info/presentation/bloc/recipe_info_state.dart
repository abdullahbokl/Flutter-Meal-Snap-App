part of 'recipe_info_bloc.dart';

@immutable
abstract class RecipeInfoState {}

class RecipeInfoInitialState extends RecipeInfoState {}

class RecipeInfoLoadingState extends RecipeInfoState {}

class RecipeInfoSuccessState extends RecipeInfoState {
  final RecipeInfoScreenModel dataModel;

  RecipeInfoSuccessState({required this.dataModel});
}

class RecipeInfoFailureState extends RecipeInfoState {
  final String message;

  RecipeInfoFailureState({required this.message});
}
