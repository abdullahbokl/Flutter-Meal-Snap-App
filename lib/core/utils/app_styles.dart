import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppStyles {
  /* Font Styles */

  static TextStyle fontStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.lato(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle fontExtraSmall({
    Color color = AppColors.white,
    double fontSize = 12,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle fontSmall({
    Color color = AppColors.white,
    double fontSize = 16,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontMedium({
    Color color = AppColors.white,
    double fontSize = 20,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontMediumBold({
    Color color = AppColors.white,
    double fontSize = 20,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontLargeBold({
    Color color = AppColors.white,
    double fontSize = 24,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontExtraLargeBold({
    Color color = AppColors.white,
    double fontSize = 32,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w900,
    );
  }

  /* Button Styles */

  static ButtonStyle buttonStyle({
    Color backgroundColor = AppColors.primary,
    Color foregroundColor = AppColors.white,
    double elevation = 0,
    double borderRadius = 8,
    double padding = 4,
  }) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      foregroundColor: MaterialStateProperty.all(foregroundColor),
      elevation: MaterialStateProperty.all(elevation),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.all(padding),
      ),
    );
  }
}
