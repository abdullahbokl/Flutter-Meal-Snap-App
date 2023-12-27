import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs_cubits/search_results_bloc/search_results_bloc.dart';
import 'search_results_item.dart';

class SearchResultsScreenBody extends StatelessWidget {
  const SearchResultsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<SearchResultsBloc, SearchResultsState>(
        builder: (context, state) {
          return GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 13 / 16,
            ),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              ...(state as SearchResultsSuccessState).results.map((result) {
                return SearchResultsItem(
                  result: result,
                );
              }).toList()
            ],
          );
        },
      ),
    ));
  }
}
