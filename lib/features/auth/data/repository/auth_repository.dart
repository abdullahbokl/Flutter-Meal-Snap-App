import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_app_exception.dart';
import '../../../../core/errors/server_exceptions.dart';
import '../../../../core/services/database_services/api/api_end_points.dart';
import '../../../../core/services/database_services/api/api_services.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/service_locator.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/reset_password_model.dart';

abstract class AuthRepo {
  Future<Either<BaseAppException, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  });

  Future<Either<BaseAppException, String>> sendCode({
    required String email,
  });

  Future<Either<BaseAppException, String>> resetPassword({
    required ResetPasswordModel resetPasswordModel,
  });
}

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<BaseAppException, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final response = await getIt<ApiServices>().post(
        ApiEndPoints.chefSignIn,
        data: loginRequestModel.toJson(),
      );
      return Right(LoginResponseModel.fromJson(response));
    } catch (error) {
      return Left(error as ServerExceptions);
    }
  }

  @override
  Future<Either<BaseAppException, String>> sendCode({
    required String email,
  }) async {
    try {
      final response = await getIt<ApiServices>().post(
        ApiEndPoints.sendCode,
        data: {
          AppStrings.apiEmail: email,
        },
      );
      return Right(response[AppStrings.apiMessage]);
    } catch (error) {
      return Left(error as ServerExceptions);
    }
  }

  @override
  Future<Either<BaseAppException, String>> resetPassword({
    required ResetPasswordModel resetPasswordModel,
  }) async {
    try {
      final response = await getIt<ApiServices>().patch(
        ApiEndPoints.changeForgottenPassword,
        data: resetPasswordModel.toJson(),
      );
      return Right(response[AppStrings.apiMessage]);
    } catch (error) {
      return Left(error as ServerExceptions);
    }
  }
}
