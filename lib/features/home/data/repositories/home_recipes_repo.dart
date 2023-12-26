import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/server_exceptions.dart';
import '../../../../core/services/database_services/api/api_services.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/food_type.dart';

abstract class HomeRecipesRepo {
  Future<Either<ServerExceptions, List<FoodType>>> getRecipes({
    required String type,
    required int no,
  });
}

class HomeRecipesRepoImpl {
  final ApiServices apiServices;

  HomeRecipesRepoImpl(this.apiServices);

  final String key = dotenv.env[AppStrings.apiKey]!;

  Future<Either<ServerExceptions, List<FoodType>>> getRecipes({
    required String type,
    required int no,
  }) async {
    try {
      final response = await apiServices.get(
        AppStrings.apiRandom,
        queryParameters: {
          'number': no,
          'tags': type,
          'apiKey': key,
        },
      );
      final List foodJsonList = response[AppStrings.apiRecipes];
      final foodList = foodJsonList.map((e) => FoodType.fromJson(e)).toList();

      return Right(foodList);
    } on ServerExceptions catch (e) {
      return Left(e);
    }
  }
}
