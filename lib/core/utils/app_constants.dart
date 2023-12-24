import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meal_snap/core/common/enums.dart';

import '../blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
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
}
