import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

asd() {}

abstract class AppStyles {
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

  static TextStyle small({
    Color color = AppColors.white,
    double fontSize = 12,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle regular({
    Color color = AppColors.white,
    double fontSize = 16,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bold({
    Color color = AppColors.white,
    double fontSize = 24,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle extraBold({
    Color color = AppColors.white,
    double fontSize = 32,
  }) {
    return fontStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
    );
  }
}
