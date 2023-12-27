import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';

class LoginWelcomeWidget extends StatelessWidget {
  const LoginWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.4.sh,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imagesBackroundTwo),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: CustomTextWidget(
          text: translate().authentication_welcomeBack,
          style: AppStyles.font32SatoshiW900,
        ),
      ),
    );
  }
}
