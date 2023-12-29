import 'package:flutter/material.dart';

import 'app_assets.dart';
import 'app_colors.dart';

abstract class AppStyles {
  /* Font Styles */

  // Telma
  static const TextStyle font24TelmaBold = TextStyle(
    fontFamily: AppAssets.fontsTelma,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryColor,
  );
  static const TextStyle font32TelmaW900 = TextStyle(
    fontFamily: AppAssets.fontsTelma,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryColor,
  );

  // Satoshi
  static const TextStyle font12SatoshiW100 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 12,
    fontWeight: FontWeight.w100,
    color: AppColors.secondaryColor,
  );
  static const TextStyle font16SatoshiBold = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryColor,
  );
  static const TextStyle font20SatoshiW500 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryColor,
  );

  static const TextStyle font24SatoshiW700 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColor,
  );

  static const TextStyle font32SatoshiW900 = TextStyle(
    fontFamily: AppAssets.fontsSatoshi,
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: AppColors.secondaryColor,
  );

  /* Button Styles */

  static ButtonStyle buttonStyle({
    Color backgroundColor = AppColors.primaryColor,
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

  // box decoration
  static final BoxDecoration primaryBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(
        offset: Offset(-2, -2),
        blurRadius: 12,
        color: Color.fromRGBO(0, 0, 0, 0.05),
      ),
      BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 5,
        color: Color.fromRGBO(0, 0, 0, 0.10),
      )
    ],
  );
}
