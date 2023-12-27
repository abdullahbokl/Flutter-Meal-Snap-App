part of 'search_results_bloc.dart';

abstract class SearchResultsEvent extends Equatable {
  const SearchResultsEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchResultsEvent extends SearchResultsEvent {
  final String typeName;

  const LoadSearchResultsEvent({
    required this.typeName,
  });
}
