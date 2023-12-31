part of 'search_cubit.dart';

class SearchState extends Equatable {
  final Status status;
  final String searchText;
  final List<SearchListTileModel> searchList;

  const SearchState({
    required this.status,
    required this.searchText,
    required this.searchList,
  });

  factory SearchState.initial() {
    return const SearchState(
      status: Status.initial,
      searchText: '',
      searchList: [],
    );
  }

  @override
  List<Object> get props => [
        status,
        searchText,
        searchList,
      ];

  SearchState copyWith({
    Status? status,
    String? searchText,
    List<SearchListTileModel>? searchList,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchText: searchText ?? this.searchText,
      searchList: searchList ?? this.searchList,
    );
  }
}
