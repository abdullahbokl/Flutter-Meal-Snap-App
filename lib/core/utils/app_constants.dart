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
      case ToastStates.warining:
        return AppColors.primary;
    }
  }
}
