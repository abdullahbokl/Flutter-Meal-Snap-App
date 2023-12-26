import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meal_snap/core/utils/app_constants.dart';

import '../../common/enums.dart';
import '../../services/database_services/cache/cache_services.dart';
import '../../utils/app_strings.dart';
import '../../utils/service_locator.dart';

part 'app_lang_state.dart';

class AppLangCubit extends Cubit<AppLangState> {
  AppLangCubit() : super(AppLangInitialState()) {
    getLocale();
  }

  AppLanguagesCodes currentLocale = AppLanguagesCodes.en;

  List<Locale> get supportedLocales {
    return AppLanguagesCodes.values.map((e) {
      return Locale(e.name);
    }).toList();
  }

  AppLanguagesCodes getLocale() {
    currentLocale = AppLanguagesCodes.en;
    try {
      final code = getIt<CacheServices>().getData(
        key: AppStrings.keyNameAppLanguage,
      );
      if (code != null) {
        currentLocale = findLangEnum(code);
      }
    } catch (e) {
      log('error getting the language from shared pref : $e');
    }
    return currentLocale;
  }

  Future<void> saveLocale() async {
    try {
      await getIt<CacheServices>().saveData(
        key: AppStrings.keyNameAppLanguage,
        value: currentLocale.name,
      );
    } catch (e) {
      log('error saving the language to shared pref : $e');
    }
  }

  Future<AppLanguagesCodes> changeLocale({
    required AppLanguagesCodes languageCode,
  }) async {
    emit(AppLangLoadingState());
    currentLocale = languageCode;
    AppConstants.appLocalizations = await initAppLocale();
    emit(AppLangSuccessState());
    Future.microtask(() async {
      await saveLocale();
    });
    return currentLocale;
  }

  Future<AppLocalizations> initAppLocale() async {
    return await AppLocalizations.delegate.load(Locale(
      getIt<AppLangCubit>().currentLocale.name,
    ));
  }

  AppLanguagesCodes findLangEnum(String? cachedLang) {
    return AppLanguagesCodes.values.firstWhere(
      (element) => element.name == cachedLang,
      orElse: () => AppLanguagesCodes.en,
    );
  }
}
