import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/data_validator.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../blocs_cubits/login_cubit/login_cubit.dart';

class LoginPassTextField extends StatelessWidget {
  const LoginPassTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = getIt<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return (current is LoginPassVisibilityState);
      },
      builder: (context, state) {
        return CustomTextFormField(
          controller: loginController.passwordController,
          hint: translate().authentication_password,
          isPassword: loginController.isLoginPassVisible,
          icon: loginController.isLoginPassVisible
              ? Icons.visibility
              : Icons.visibility_off,
          suffixIconOnPressed: () {
            loginController.changeIsLoginVisibility();
          },
          validate: (data) {
            String error = "";
            final errorsList = DataValidator.validatePassword(data);
            for (final item in errorsList) {
              error += "$item\n";
            }
            return error.isEmpty ? null : error;
          },
        );
      },
    );
  }
}
