import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/server_exceptions.dart';
import '../../../../core/services/database_services/api/api_services.dart';
import '../../../../core/utils/app_strings.dart';

abstract class RecipeInfoRepo {
  Future<Either<ServerExceptions, List<dynamic>>> getRecipeInfo({
    required String id,
  });
}

class RecipeInfoRepoImpl implements RecipeInfoRepo {
  final String key = dotenv.env[AppStrings.envApiKey]!;
  final ApiServices apiServices;

  RecipeInfoRepoImpl(this.apiServices);

  @override
  Future<Either<ServerExceptions, List<dynamic>>> getRecipeInfo({
    required String id,
  }) async {
    final String infoUrl =
        '${AppStrings.apiRecipesEndPoint}/$id/${AppStrings.apiInformationEndPoint}';
    final String similarUrl =
        '${AppStrings.apiRecipesEndPoint}/$id/${AppStrings.apiSimilarEndPoint}';
    final String equipmentUrl =
        '${AppStrings.apiRecipesEndPoint}/$id/${AppStrings.apiEquipmentsEndPoint}';
    final String nutritionUrl =
        '${AppStrings.apiRecipesEndPoint}/$id/${AppStrings.apiNutritionEndPoint}';

    try {
      final response = await Future.wait([
        apiServices.get(infoUrl, queryParameters: {
          AppStrings.apiKey: key,
        }),
        apiServices.get(similarUrl, queryParameters: {
          AppStrings.apiKey: key,
        }),
        apiServices.get(equipmentUrl, queryParameters: {
          AppStrings.apiKey: key,
        }),
        apiServices.get(nutritionUrl, queryParameters: {
          AppStrings.apiKey: key,
        }),
      ]);

      return Right(response);
    } on ServerExceptions catch (e) {
      return Left(e);
    }
  }
}
