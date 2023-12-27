import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        style: AppStyles.fontSmall().copyWith(
          color: Colors.black,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
