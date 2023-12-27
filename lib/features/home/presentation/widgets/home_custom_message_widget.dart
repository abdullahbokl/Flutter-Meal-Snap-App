import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_colors.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/utils/app_styles.dart';

class HomeCustomMessageWidget extends StatelessWidget {
  const HomeCustomMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(microseconds: 600),
      child: Text(
        "Simple Way to find \nTasty food",
        style: AppStyles.font32TelmaW900.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
      ),
    );
  }
}
