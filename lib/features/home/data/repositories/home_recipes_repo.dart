import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../../../../core/errors/server_exceptions.dart';
import '../../../../core/services/database_services/api/api_end_points.dart';
import '../../../../core/services/database_services/api/api_services.dart';
import '../../../../core/utils/app_strings.dart';

abstract class HomeRecipesRepo {
  Future<Either<ServerExceptions, List<FoodTypeModel>>> getRecipes({
    required String type,
    required int no,
  });
}

class HomeRecipesRepoImpl implements HomeRecipesRepo {
  final ApiServices apiServices;

  HomeRecipesRepoImpl(this.apiServices);

  final String apiKey = dotenv.env[AppStrings.envApiKey]!;

  @override
  Future<Either<ServerExceptions, List<FoodTypeModel>>> getRecipes({
    required String type,
    required int no,
  }) async {
    try {
      final response = await apiServices.get(
        "${ApiEndPoints.apiRecipes}/${ApiEndPoints.apiRandom}",
        queryParameters: {
          AppStrings.query: type,
          AppStrings.number: no,
          AppStrings.apiKey: apiKey,
        },
      );
      final List foodJsonList = response[ApiEndPoints.apiRecipes];
      final foodList =
          foodJsonList.map((e) => FoodTypeModel.fromJson(e)).toList();

      if (foodList.isNotEmpty) {
        return Right(foodList);
      }
    } on ServerExceptions catch (e) {
      return Left(e);
    }
    return Left(ServerExceptions("No Data Found"));
  }
}
