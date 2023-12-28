import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/custom_search_field.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/home_body_model.dart';
import '../blocs_cubits/home_bloc.dart';
import 'home_sections.dart';

class HomeFoodViewer extends StatefulWidget {
  const HomeFoodViewer({
    super.key,
    required this.homeBodyModel,
  });

  final HomeBodyModel homeBodyModel;

  @override
  State<HomeFoodViewer> createState() => _HomeFoodViewerState();
}

class _HomeFoodViewerState extends State<HomeFoodViewer> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = getIt();
    return Column(
      children: [
        CustomSearchField(
          searchController: homeBloc.searchController,
          onSubmitted: () {
            if (homeBloc.searchController.text.trim().isNotEmpty) {
              setState(() {});
            }
          },
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {});
            }
          },
        ),
        const Gap(10),
        homeBloc.searchController.text.isEmpty
            ? HomeSections(homeBodyModel: widget.homeBodyModel)
            : const Center(child: Text("Search Results")),
      ],
    );
  }
}
