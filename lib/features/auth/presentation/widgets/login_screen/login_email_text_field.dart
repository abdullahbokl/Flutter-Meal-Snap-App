import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/data_validator.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../blocs_cubits/login_cubit/login_cubit.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: getIt<LoginCubit>().emailController,
      hint: translate().authentication_email,
      validate: (data) {
        String error = "";
        final errorsList = DataValidator.validateEmail(data);
        for (final item in errorsList) {
          error += "$item\n";
        }
        return error.isEmpty ? null : error;
      },
    );
  }
}
