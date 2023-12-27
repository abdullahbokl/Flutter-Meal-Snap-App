import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/server_exceptions.dart';
import '../../../../core/services/database_services/api/api_services.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/search_auto_complete_model.dart';
import '../models/search_result_model.dart';

abstract class SearchRepo {
  Future<Either<ServerExceptions, List<SearchResultModel>>> getSearchList({
    required String type,
    required int no,
  });

  Future<Either<ServerExceptions, List<SearchAutoCompleteModel>>>
      getAutoCompleteList({
    required String searchText,
  });
}

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);

  final String apiKey = dotenv.env[AppStrings.envApiKey]!;

  @override
  Future<Either<ServerExceptions, List<SearchResultModel>>> getSearchList({
    required String type,
    required int no,
  }) async {
    const String url = "/recipes/complexSearch";
    try {
      final response = await apiServices.get(
        url,
        queryParameters: {
          AppStrings.query: type,
          AppStrings.number: no,
          AppStrings.apiKey: apiKey,
        },
      );
      if (response != null) {
        final List<SearchResultModel> list = [];
        for (final v in response[AppStrings.results]) {
          list.add(SearchResultModel.fromJson(v));
        }
        return Right(list);
      }
    } on ServerExceptions catch (e) {
      return Left(e);
    }
    return Left(ServerExceptions("No Data Found"));
  }

  @override
  Future<Either<ServerExceptions, List<SearchAutoCompleteModel>>>
      getAutoCompleteList({
    required String searchText,
  }) async {
    const String url = "/recipes/autocomplete";

    try {
      final response = await apiServices.get(
        url,
        queryParameters: {
          AppStrings.number: 100,
          AppStrings.query: searchText,
          AppStrings.apiKey: apiKey,
        },
      );
      if (response != null) {
        final List<SearchAutoCompleteModel> list = [];
        for (final v in response) {
          list.add(SearchAutoCompleteModel.fromJson(v));
        }
        return Right(list);
      }
    } on ServerExceptions catch (e) {
      return Left(e);
    }
    return Left(ServerExceptions("No Data Found"));
  }
}
