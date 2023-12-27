part of 'search_results_bloc.dart';

abstract class SearchResultsState extends Equatable {
  const SearchResultsState();

  @override
  List<Object> get props => [];
}

class SearchResultsInitialState extends SearchResultsState {}

class SearchResultsLoadingState extends SearchResultsState {}

class SearchResultsSuccessState extends SearchResultsState {
  final List<SearchResultModel> results;

  const SearchResultsSuccessState({
    required this.results,
  });
}

class SearchResultsFailureState extends SearchResultsState {
  final String message;

  const SearchResultsFailureState({
    required this.message,
  });
}
