import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/common/widgets/custom_search_field.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/search_cubit/search_cubit.dart';
import '../widgets/search_screen/search_results_list_view.dart';
import '../widgets/search_screen/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchCubit = getIt<SearchCubit>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: customAppBar(
          bottom: AppBarBottomModel(
            height: 12,
            child: CustomSearchField(
              searchController: searchCubit.searchController,
              onChanged: (text) => searchCubit.textChange(),
              onSubmitted: () => searchCubit.textChange(),
            ),
          ),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const CustomLoadingIndicator();
            } else if (state.status == Status.success &&
                state.searchList.isNotEmpty) {
              return SearchResultsListView(searchList: state.searchList);
            } else if (state.status == Status.failure) {
              return const CustomErrorWidget(message: AppStrings.noDataFound);
            } else {
              return const SearchScreenBody();
            }
          },
        ),
      ),
    );
  }
}
