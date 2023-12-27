import 'package:flutter/material.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_styles.dart';

class LoginForgetPassButton extends StatelessWidget {
  const LoginForgetPassButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AppNavigator.pushReplacementNamed(
          Routes.sendCodeScreen,
        );
      },
      child: Text(
        translate().authentication_forgetPassword,
        style: AppStyles.font16SatoshiBold.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
