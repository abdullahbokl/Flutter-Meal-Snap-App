import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

import '../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 48,
    this.width = double.infinity,
    this.backgroundColor,
  });

  final double height;
  final double width;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppStyles.buttonStyle(
          backgroundColor: AppColors.black,
        ),
        child: Text(
          text,
          style: AppStyles.fontLargeBold(),
        ),
      ),
    );
  }
}
