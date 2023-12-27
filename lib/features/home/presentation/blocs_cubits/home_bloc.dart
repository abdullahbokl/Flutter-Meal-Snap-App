import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../../../../core/errors/server_exceptions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/home_body_model.dart';
import '../../data/repositories/home_recipes_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRecipesRepo homeRecipesRepo = getIt();

  HomeBloc() : super(HomeInitialState()) {
    on<LoadHomeDataEvent>(_loadHomeRecipe);
  }

  _loadHomeRecipe(LoadHomeDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final data = await _fetchAllData();

    final List<String> exception = [];
    final List<List<FoodTypeModel>?> foodList = [];

    _handleDataAndExceptions(
      data: data,
      exception: exception,
      foodList: foodList,
    );

    if (exception.isNotEmpty) {
      emit(HomeFailureState(message: exception.first));
    } else {
      emit(HomeSuccessState(
        homeBodyModel: HomeBodyModel(
          breakfast: foodList[0] as List<FoodTypeModel>,
          lunch: foodList[1] as List<FoodTypeModel>,
          drinks: foodList[2] as List<FoodTypeModel>,
          pizza: foodList[3] as List<FoodTypeModel>,
          burgers: foodList[4] as List<FoodTypeModel>,
          cake: foodList[5] as List<FoodTypeModel>,
          rice: foodList[6] as List<FoodTypeModel>,
        ),
      ));
    }
  }

  void _handleDataAndExceptions({
    required List<Either<ServerExceptions, List<FoodTypeModel>>> data,
    required List<String> exception,
    required List<List<FoodTypeModel>?> foodList,
  }) {
    data.map((e) {
      e.fold(
        (l) => exception.add(l.message),
        (r) => foodList.add(r),
      );
    }).toList();
  }

  Future<List<Either<ServerExceptions, List<FoodTypeModel>>>>
      _fetchAllData() async {
    return await Future.wait([
      homeRecipesRepo.getRecipes(
        type: AppStrings.foodTypeBreakfast,
        no: 20,
      ),
      homeRecipesRepo.getRecipes(
        type: AppStrings.foodTypeLunch,
        no: 3,
      ),
      homeRecipesRepo.getRecipes(
        type: AppStrings.foodTypeDrinks,
        no: 20,
      ),
      homeRecipesRepo.getRecipes(
        type: AppStrings.foodTypePizza,
        no: 3,
      ),
      homeRecipesRepo.getRecipes(
        type: AppStrings.foodTypeBurgers,
        no: 20,
      ),
      homeRecipesRepo.getRecipes(
        type: AppStrings.foodTypeCake,
        no: 20,
      ),
      homeRecipesRepo.getRecipes(
        type: AppStrings.foodTypeRice,
        no: 20,
      ),
    ]);
  }
}
