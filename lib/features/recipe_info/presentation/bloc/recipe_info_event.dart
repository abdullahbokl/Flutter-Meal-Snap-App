part of 'recipe_info_bloc.dart';

@immutable
abstract class RecipeInfoEvent {}

class LoadRecipeInfoEvent extends RecipeInfoEvent {
  final String id;

  LoadRecipeInfoEvent({required this.id});
}
