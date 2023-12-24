import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
import '../../../../core/common/enums.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_image.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/service_locator.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLangCubit = getIt<AppLangCubit>();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //background image
            const CustomImage(
              imgPath: AppAssets.imagesBackround,
              w: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Gap(120.h),
                  CustomImage(
                    imgPath: AppAssets.imagesLogo,
                    h: 120.h,
                    w: 120.w,
                  ),
                  Gap(16.h),
                  Text(
                    "translate().app_appName",
                    style: AppStyles.fontBold(),
                  ),
                  Gap(100.h),
                  Text(
                    "translate().authentication_pleaseChooseYourLanguage",
                    style: AppStyles.fontBold(),
                  ),
                  Gap(50.h),
                  BlocBuilder<AppLangCubit, AppLangState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          CustomButton(
                            text: 'English',
                            onPressed: () {
                              appLangCubit.changeLocale(
                                languageCode: AppLanguagesCodes.en,
                              );
                              AppNavigator.pushNamed(Routes.initialRoute);
                            },
                            width: 140,
                            backgroundColor: AppColors.black,
                          ),
                          const Spacer(),
                          CustomButton(
                            text: 'العربية',
                            onPressed: () {
                              appLangCubit.changeLocale(
                                languageCode: AppLanguagesCodes.ar,
                              );
                              AppNavigator.pushNamed(Routes.initialRoute);
                            },
                            width: 140,
                            backgroundColor: AppColors.black,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
