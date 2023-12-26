import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:meal_snap/features/auth/data/models/signup_model.dart';

import '../../../../../features/auth/data/models/login_request_model.dart';
import '../../../../../features/auth/data/models/reset_password_model.dart';
import '../../../../errors/base_app_exception.dart';

abstract class AuthServices {
  Future<User> login({
    required LoginRequestModel loginRequestModel,
  });

  Future<User> signUp({
    required SignUpModel signUpModel,
  });

  Future<Token> sendCode({
    required String email,
    required String password,
  });

  Future<Either<BaseAppException, String>> resetPassword({
    required ResetPasswordModel resetPasswordModel,
  });

  Future<Either<BaseAppException, String>> logout();

  Future<Either<BaseAppException, String>> updatePassword({
    required String password,
    required String newPassword,
  });
}
