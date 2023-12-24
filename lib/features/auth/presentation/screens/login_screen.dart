import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/enums.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_image.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header that contains image and welcome back text
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const CustomImage(
                  imgPath: AppAssets.imagesBackround,
                  w: double.infinity,
                ),
                Center(
                  child: CustomTextWidget(
                    text: translate().authentication_welcomeBack,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    AppConstants.showToast(
                      message: translate().authentication_loginSuccessfully,
                      state: ToastStates.success,
                    );
                    AppNavigator.pushReplacementNamed(Routes.homeScreen);
                  }
                  if (state is LoginErrorState) {
                    AppConstants.showToast(
                      message: state.message,
                      state: ToastStates.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<LoginCubit>(context).loginKey,
                    child: Column(
                      children: [
                        //! email
                        CustomTextFormField(
                          controller: BlocProvider.of<LoginCubit>(context)
                              .emailController,
                          hint: translate().authentication_email,
                          validate: (data) {},
                        ),
                        SizedBox(height: 32.h),
                        //!password
                        CustomTextFormField(
                          controller: BlocProvider.of<LoginCubit>(context)
                              .passwordController,
                          hint: translate().authentication_password,
                          isPassword: getIt<LoginCubit>().isLoginPassVisible,
                          icon: getIt<LoginCubit>().isLoginPassVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixIconOnPressed: () {
                            getIt<LoginCubit>().isLoginPassVisible =
                                !getIt<LoginCubit>().isLoginPassVisible;
                          },
                          validate: (data) {},
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                AppNavigator.pushReplacementNamed(
                                  Routes.sendCodeScreen,
                                );
                              },
                              child: Text(
                                translate().authentication_forgetPassword,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        state is LoginLoadingState
                            ? const CustomLoadingIndicator()
                            : CustomButton(
                                onPressed: () {
                                  if (BlocProvider.of<LoginCubit>(context)
                                      .loginKey
                                      .currentState!
                                      .validate()) {
                                    BlocProvider.of<LoginCubit>(context)
                                        .login();
                                  }
                                },
                                text: translate().authentication_sign_in,
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
