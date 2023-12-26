import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/database_services/cache/cache_services.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/login_request_model.dart';
import '../../../data/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    emailController.text = "moga672002@gmail.com";
    passwordController.text = "aA123456!";
  }

  final authRepo = getIt<AuthRepo>();

  // Form keys and controllers
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // password visibility
  bool _isLoginPassVisible = true;

  bool get isLoginPassVisible => _isLoginPassVisible;

  void changeIsLoginVisibility() {
    _isLoginPassVisible = !_isLoginPassVisible;
    emit(LoginPassVisibilityState());
  }

  // login method
  User? user;

  Future<void> login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      loginRequestModel: LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (l) => emit(LoginErrorState(l.message)),
      (r) async {
        user = r;
        emit(LoginSuccessState());
        Future.microtask(() async {
          await _cacheLoginData(r);
        });
      },
    );
  }

  Future<void> _cacheLoginData(User user) async {
    // save token
    final Account account = Account(getIt<Client>());
    final Jwt userToken = await account.createJWT();
    await getIt<CacheServices>().saveData(
      key: AppStrings.prefsToken,
      value: userToken.jwt,
    );
    // save id
    await getIt<CacheServices>().saveData(
      key: AppStrings.prefsId,
      value: user.$id,
    );
  }
}
