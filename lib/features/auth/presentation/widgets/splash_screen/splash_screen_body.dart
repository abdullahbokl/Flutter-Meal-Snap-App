import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/widgets/custom_image.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(
            imgPath: AppAssets.imagesLogo,
            h: 120.h,
            w: 120.w,
          ),
          const Gap(10),
          Text(
            translate().app_appName,
            style: AppStyles.fontExtraLargeBold(),
          )
        ],
      ),
    );
  }
}
