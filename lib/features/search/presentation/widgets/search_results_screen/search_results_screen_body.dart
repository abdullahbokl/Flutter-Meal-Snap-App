import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_snap/core/common/models/food_type_model.dart';
import 'package:meal_snap/core/common/widgets/custom_recipe_card.dart';

import '../../blocs_cubits/search_results_bloc/search_results_bloc.dart';

class SearchResultsScreenBody extends StatelessWidget {
  const SearchResultsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<SearchResultsBloc, SearchResultsState>(
        builder: (context, state) {
          return GridView.builder(
            itemCount: (state as SearchResultsSuccessState).results.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 13 / 16,
            ),
            itemBuilder: (context, index) {
              final result = (state).results[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomRecipeCard(
                  item: FoodTypeModel(
                    id: result.id,
                    name: result.name,
                    image: result.image,
                  ),
                ),
              );
            },
          );
        },
      ),
    ));
  }
}
