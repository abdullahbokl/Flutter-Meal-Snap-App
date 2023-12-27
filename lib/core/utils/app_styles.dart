import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_assets.dart';
import 'app_colors.dart';

abstract class AppStyles {
  /* Font Styles */

  // Telma
  static final TextStyle font24TelmaBold = TextStyle(
    fontFamily: AppAssets.fontsTelma,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryFontColor,
  );

  static final TextStyle font32TelmaW900 = TextStyle(
    fontFamily: AppAssets.fontsTelma,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryFontColor,
  );

  // Satoshi
  static final TextStyle font12SatoshiW100 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 12.sp,
    fontWeight: FontWeight.w100,
    color: AppColors.primaryFontColor,
  );
  static final TextStyle font16SatoshiBold = TextStyle(
    fontFamily: AppAssets.fontsTelma,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryFontColor,
  );

  static final TextStyle font20SatoshiW500 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryFontColor,
  );

  static final TextStyle font24SatoshiW700 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryFontColor,
  );

  static final TextStyle font32SatoshiW900 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 32.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.primaryFontColor,
  );

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
