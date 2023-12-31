import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/search_auto_complete_model.dart';
import 'search_auto_complete_tile.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({
    super.key,
    required this.searchList,
  });

  final List<SearchAutoCompleteModel> searchList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return SearchAutoCompleteTile(item: searchList[index]);
      },
      separatorBuilder: (context, index) {
        return const Gap(10);
      },
      itemCount: searchList.length,
    );
  }
}
