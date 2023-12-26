import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_routes.dart';
import '../blocs_cubits/login_cubit/login_cubit.dart';
import '../widgets/login_screen/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            AppConstants.showToast(
              message: translate().authentication_loginSuccessfully,
              state: ToastStates.success,
            );
            AppNavigator.pushReplacementNamed(Routes.homeScreen);
          } else if (state is LoginErrorState) {
            log("LoginErrorState: ${state.message}");
            AppConstants.showToast(
              message: state.message,
              state: ToastStates.error,
            );
          }
        },
        child: const LoginScreenBody(),
      ),
    );
  }
}
