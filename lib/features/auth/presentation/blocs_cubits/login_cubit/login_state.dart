part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}

final class LoginSuccessState extends LoginState {}

final class LoginPassVisibilityState extends LoginState {
  LoginPassVisibilityState();
}
