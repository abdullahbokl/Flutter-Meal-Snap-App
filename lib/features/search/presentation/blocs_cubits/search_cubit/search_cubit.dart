import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/search_list_tile_model.dart';
import '../../../data/repositories/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  final searchController = TextEditingController();
  final repo = getIt<SearchRepo>();

  void textChange() async {
    if (searchController.text.length < 3) {
      emit(state.copyWith(
        status: Status.initial,
        searchText: searchController.text,
        searchList: [],
      ));
      return;
    }
    emit(state.copyWith(
      status: Status.loading,
      searchText: searchController.text,
    ));
    final list = await repo.getAutoCompleteList(
      searchText: searchController.text,
    );
    list.fold(
      (l) {
        emit(state.copyWith(
          status: Status.failure,
          searchList: [],
        ));
      },
      (r) {
        emit(state.copyWith(
          status: Status.success,
          searchList: r,
        ));
      },
    );
  }
}
