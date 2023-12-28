import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_snap/core/utils/app_strings.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/models/recipe/equipment.dart';
import '../../../../core/common/models/recipe/nutrients.dart';
import '../../../../core/common/models/recipe/racipe_model.dart';
import '../../../../core/common/models/recipe/similar_list.dart';
import '../../../../core/errors/server_exceptions.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repositories/recipe_info_repo.dart';

part 'recipe_info_event.dart';
part 'recipe_info_state.dart';

class RecipeInfoBloc extends Bloc<RecipeInfoEvent, RecipeInfoState> {
  final RecipeInfoRepo recipeInfoRepo = getIt<RecipeInfoRepo>();

  RecipeInfoBloc() : super(RecipeInfoInitialState()) {
    on<LoadRecipeInfoEvent>(_loadRecipeInfo);
  }

  _loadRecipeInfo(
      LoadRecipeInfoEvent event, Emitter<RecipeInfoState> emit) async {
    emit(RecipeInfoLoadingState());
    final data = await recipeInfoRepo.getRecipeInfo(id: event.id);

    final List<String> exceptions = [];
    final List<dynamic> handledData = [];

    _handleDataAndExceptions(
      data: data,
      exception: exceptions,
      handleData: handledData,
    );

    if (exceptions.isNotEmpty) {
      emit(RecipeInfoFailureState(message: exceptions.first));
    } else {
      emit(
        RecipeInfoSuccessState(
          recipe: RecipeInfoModel.fromJson(handledData[0]),
          similar: SimilarList.fromJson(handledData[1]).list,
          equipment: EquipmentsList.fromJson(handledData[2]).items,
          nutrient: Nutrient.fromJson(handledData[3]),
        ),
      );
    }
  }

  void _handleDataAndExceptions({
    required Either<ServerExceptions, List<dynamic>> data,
    required List<String> exception,
    required List<dynamic> handleData,
  }) {
    data.fold(
      (l) => exception.add(l.message),
      (r) {
        handleData.addAll(r);
        handleData[2] = handleData[2][AppStrings.apiEquipment];
      },
    );
  }
}
