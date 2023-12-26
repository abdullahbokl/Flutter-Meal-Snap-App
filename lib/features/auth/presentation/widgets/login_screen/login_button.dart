import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../blocs_cubits/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = getIt<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        if (previous != current) {
          if (current is LoginLoadingState ||
              current is LoginSuccessState ||
              current is LoginErrorState) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const CustomLoadingIndicator();
        }
        return CustomButton(
          onPressed: () {
            if (loginController.loginKey.currentState!.validate()) {
              loginController.login();
            }
          },
          text: translate().authentication_sign_in,
        );
      },
    );
  }
}
