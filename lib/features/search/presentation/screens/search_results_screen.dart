import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/search_results_screen_arguments.dart';
import '../blocs_cubits/search_results_bloc/search_results_bloc.dart';
import '../widgets/search_results_screen/search_results_screen_body.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({
    super.key,
    required this.args,
  });

  final SearchResultsScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchResultsBloc>()
        ..add(LoadSearchResultsEvent(
          typeName: args.typeName,
        )),
      child: Scaffold(
        appBar: customAppBar(title: AppStrings.appName, isShowBackButton: true),
        body: BlocBuilder<SearchResultsBloc, SearchResultsState>(
          builder: (context, state) {
            if (state is SearchResultsLoadingState) {
              return const Center(child: CustomLoadingIndicator());
            } else if (state is SearchResultsSuccessState) {
              return const SearchResultsScreenBody();
            } else if (state is SearchResultsFailureState) {
              return CustomErrorWidget(message: state.message);
            } else {
              return const CustomErrorWidget(message: "Something went wrong");
            }
          },
        ),
      ),
    );
  }
}
