part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final HomeBodyModel homeBodyModel;

  HomeSuccessState({
    required this.homeBodyModel,
  });
}

class HomeFailureState extends HomeState {
  final String message;

  HomeFailureState({required this.message});
}
