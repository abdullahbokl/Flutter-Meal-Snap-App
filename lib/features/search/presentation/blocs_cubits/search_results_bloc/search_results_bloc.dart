import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/search_result_model.dart';
import '../../../data/repositories/search_repo.dart';

part 'search_results_event.dart';
part 'search_results_state.dart';

class SearchResultsBloc extends Bloc<SearchResultsEvent, SearchResultsState> {
  final SearchRepo repo = getIt<SearchRepo>();

  SearchResultsBloc() : super(SearchResultsInitialState()) {
    on<LoadSearchResultsEvent>(_loadSearchResults);
  }

  _loadSearchResults(LoadSearchResultsEvent event, Emitter emit) async {
    emit(SearchResultsLoadingState());
    final results = await repo.getSearchList(
      type: event.typeName,
      no: 100,
    );

    results.fold(
      (l) => emit(SearchResultsFailureState(message: l.toString())),
      (r) => emit(SearchResultsSuccessState(results: r)),
    );
  }
}
