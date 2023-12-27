import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/search_results_bloc/search_results_bloc.dart';
import '../widgets/search_results_screen/search_results_screen_body.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({
    super.key,
    required this.typeName,
  });

  final String typeName;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchResultsBloc>()
        ..add(LoadSearchResultsEvent(typeName: widget.typeName)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
          title: "Meal Snap",
        ),
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
