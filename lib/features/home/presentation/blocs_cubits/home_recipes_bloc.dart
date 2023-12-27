import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repositories/home_recipes_repo.dart';

part 'home_recipes_event.dart';
part 'home_recipes_state.dart';

class HomeRecipesBloc extends Bloc<HomeRecipesEvent, HomeRecipesState> {
  final HomeRecipesRepo homeRecipesRepo = getIt();

  HomeRecipesBloc() : super(HomeRecipesInitial()) {
    on<HomeRecipesEvent>((event, emit) async {
      if (event is LoadHomeRecipe) {
        emit(HomeRecipesLoading());
        final data = await Future.wait([
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

        final List<String> exception = [];

        final List<List<FoodTypeModel>?> foodList = data.map((e) {
          e.fold(
            (l) => exception.add(l.message),
            (r) => null,
          );
          return e.fold(
            (l) => null,
            (r) => r,
          );
        }).toList();

        if (exception.isNotEmpty) {
          emit(HomeFailureState(error: exception.first));
        } else {
          emit(HomeRecipesSuccess(
            breakfast: foodList[0] as List<FoodTypeModel>,
            lunch: foodList[1] as List<FoodTypeModel>,
            drinks: foodList[2] as List<FoodTypeModel>,
            pizza: foodList[3] as List<FoodTypeModel>,
            burgers: foodList[4] as List<FoodTypeModel>,
            cake: foodList[5] as List<FoodTypeModel>,
            rice: foodList[6] as List<FoodTypeModel>,
          ));
        }
      }
    });
  }
}
