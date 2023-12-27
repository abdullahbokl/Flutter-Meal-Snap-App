import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/widgets/custom_image.dart';
import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';
import 'change_lang_buttons.dart';

class ChangeLangScreenBody extends StatelessWidget {
  const ChangeLangScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Gap(150.h),
              CustomImage(
                imgPath: AppAssets.imagesLogo,
                h: 120.h,
                w: 120.w,
              ),
              Gap(16.h),
              CustomTextWidget(
                text: translate().app_appName,
                style: AppStyles.font32TelmaW900.copyWith(
                  color: AppColors.white,
                ),
              ),
              Gap(80.h),
              CustomTextWidget(
                text: translate().authentication_pleaseChooseYourLanguage,
                style: AppStyles.font20SatoshiW500.copyWith(
                  color: AppColors.white,
                ),
              ),
              Gap(30.h),
              const ChangeLangButtons(),
            ],
          ),
        ),
      ],
    );
  }
}
