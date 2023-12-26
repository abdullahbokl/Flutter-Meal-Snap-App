import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_snap/core/utils/app_assets.dart';

import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      expandedHeight: 0.4.sh,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            CustomTextWidget(
              text: translate().authentication_welcomeBack,
              style: AppStyles.fontExtraLargeBold(),
            ),
            const Spacer(flex: 1),
          ],
        ),
        centerTitle: true,
        background: Image.asset(
          AppAssets.imagesBackroundTwo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
