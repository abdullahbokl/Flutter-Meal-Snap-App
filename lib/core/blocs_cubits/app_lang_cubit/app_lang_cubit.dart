import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../common/enums.dart';
import '../../services/database_services/cache/cache_services.dart';
import '../../utils/app_strings.dart';
import '../../utils/service_locator.dart';

part 'app_lang_state.dart';

class AppLangCubit extends Cubit<AppLangState> {
  // call _initFlutterLocalization() directly from the constructor

  AppLangCubit() : super(AppLangInitialState());

  AppLanguagesCodes currentLocale = AppLanguagesCodes.en;

  List<Locale> get supportedLocales {
    return AppLanguagesCodes.values.map((e) {
      return Locale(e.name);
    }).toList();
  }

  Future<void> saveLocale() async {
    emit(AppLangLoadingState());
    try {
      await getIt<CacheServices>().saveData(
        key: AppStrings.keyNameAppLanguage,
        value: currentLocale.name,
      );
      emit(AppLangSuccessState());
    } catch (e) {
      emit(AppLangErrorState(e.toString()));
    }
  }

  AppLanguagesCodes getLocale() {
    emit(AppLangLoadingState());
    currentLocale = AppLanguagesCodes.en;
    try {
      final code = getIt<CacheServices>().getData(
        key: AppStrings.keyNameAppLanguage,
      );
      if (code != null) {
        currentLocale = findLangEnum(code);
      }
      emit(AppLangSuccessState());
    } catch (e) {
      log('error getting the language from shared pref : $e');
      emit(AppLangErrorState(e.toString()));
    }
    return currentLocale;
  }

  AppLanguagesCodes changeLocale({
    required AppLanguagesCodes languageCode,
  }) {
    currentLocale = languageCode;
    emit(AppLangLoadingState());
    Future.microtask(() {
      saveLocale();
    });
    emit(AppLangSuccessState());
    return currentLocale;
  }

  AppLanguagesCodes findLangEnum(String? cachedLang) {
    return AppLanguagesCodes.values.firstWhere(
      (element) => element.name == cachedLang,
      orElse: () => AppLanguagesCodes.en,
    );
  }
}
