import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../blocs_cubits/login_cubit/login_cubit.dart';
import 'login_button.dart';
import 'login_email_text_field.dart';
import 'login_forget_pass_button.dart';
import 'login_pass_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: getIt<LoginCubit>().loginKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // email
            const LoginEmailTextField(),
            Gap(32.h),
            // password
            const LoginPassTextField(),
            Gap(24.h),
            // forget password
            const LoginForgetPassButton(),
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}
