import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:meal_snap/core/utils/app_strings.dart';
import 'package:meal_snap/features/auth/data/models/signup_model.dart';

import '../../../../../features/auth/data/models/login_request_model.dart';
import '../../../../../features/auth/data/models/reset_password_model.dart';
import '../../../../errors/base_app_exception.dart';
import '../../../../errors/server_exceptions.dart';
import '../dio/auth_services.dart';

// import 'package:appwrite/models.dart' as models;
// import 'package:appwrite/appwrite.dart';

class AppWriteServices extends AuthServices {
  final Account account;

  AppWriteServices(this.account);

  @override
  Future<User> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final session = await account.createEmailSession(
        email: loginRequestModel.email,
        password: loginRequestModel.password,
      );
      final User user = await account.get();
      return user;
    } on AppwriteException catch (e) {
      throw ServerExceptions.handle(e);
    }
  }

  @override
  Future<User> signUp({
    required SignUpModel signUpModel,
  }) async {
    try {
      final User user = await account.create(
        userId: ID.unique(),
        email: signUpModel.email,
        password: signUpModel.password,
        name: signUpModel.name,
      );
      await sendCode(
        email: signUpModel.email,
        password: signUpModel.password,
      );
      return user;
    } on AppwriteException catch (e) {
      throw ServerExceptions.handle(e);
    }
  }

  @override
  Future<Token> sendCode({
    required String email,
    required String password,
  }) async {
    await account.createEmailSession(
      email: email,
      password: password,
    );
    final token =
        await account.createVerification(url: AppStrings.appWriteEndPoint);
    return token;
  }

  @override
  Future<Either<BaseAppException, String>> logout() {
//   await account.deleteSession(sessionId: 'current');

    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseAppException, String>> resetPassword(
      {required ResetPasswordModel resetPasswordModel}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseAppException, String>> updatePassword(
      {required String password, required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
