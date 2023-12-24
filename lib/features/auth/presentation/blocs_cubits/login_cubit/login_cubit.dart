import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meal_snap/core/services/database_services/cache/cache_services.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/login_request_model.dart';
import '../../../data/models/login_response_model.dart';
import '../../../data/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepoImpl authRepo;

  // Form keys and controllers
  GlobalKey<FormState> loginKey = GlobalKey<FormState>(debugLabel: '3');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // password visibility
  bool _isLoginPassVisible = true;

  bool get isLoginPassVisible => _isLoginPassVisible;

  set isLoginPassVisible(bool value) {
    _isLoginPassVisible = value;
    emit(ChangeLoginPassIconVisibility());
  }

  // login method
  LoginResponseModel? loginModel;

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
        loginModel = r;
        await _cacheLoginData(r);
        emit(LoginSuccessState());
      },
    );
  }

  Future<void> _cacheLoginData(LoginResponseModel r) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
    await getIt<CacheServices>().saveData(
      key: AppStrings.prefsId,
      value: decodedToken[AppStrings.prefsId],
    );
    await getIt<CacheServices>().saveData(
      key: AppStrings.prefsToken,
      value: r.token,
    );
  }
}
