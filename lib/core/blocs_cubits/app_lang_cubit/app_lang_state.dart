part of 'app_lang_cubit.dart';

@immutable
abstract class AppLangState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AppLangInitialState extends AppLangState {}

final class AppLangLoadingState extends AppLangState {}

final class AppLangSuccessState extends AppLangState {}

final class AppLangErrorState extends AppLangState {
  final String errorMessage;

  AppLangErrorState(this.errorMessage);
}
