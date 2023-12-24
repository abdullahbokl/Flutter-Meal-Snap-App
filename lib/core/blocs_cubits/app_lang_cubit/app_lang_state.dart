part of 'app_lang_cubit.dart';

@immutable
abstract class AppLangState {}

final class AppLangInitialState extends AppLangState {}

final class AppLangLoadingState extends AppLangState {}

final class AppLangSuccessState extends AppLangState {}

final class AppLangErrorState extends AppLangState {
  final String errorMessage;

  AppLangErrorState(this.errorMessage);
}
