import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meal_snap/core/common/enums.dart';

import '../blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
import 'app_colors.dart';
import 'service_locator.dart';

AppLocalizations translate() {
  return AppConstants.appLocalizations;
}

class AppConstants {
  static late AppLocalizations appLocalizations;

  static TextDirection get appTextDirection =>
      getIt<AppLangCubit>().currentLocale == AppLanguagesCodes.ar
          ? TextDirection.rtl
          : TextDirection.ltr;

  static void showToast({
    required String message,
    required ToastStates state,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: _getToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Color _getToastColor(ToastStates state) {
    switch (state) {
      case ToastStates.error:
        return AppColors.red;
      case ToastStates.success:
        return AppColors.green;
      case ToastStates.warning:
        return AppColors.primaryColor;
    }
  }

  static MaterialColor colorToMaterialColor(Color color) {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
