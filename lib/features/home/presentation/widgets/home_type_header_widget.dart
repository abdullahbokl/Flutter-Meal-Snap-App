import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../search/presentation/blocs_cubits/search_results_bloc/search_results_bloc.dart';
import '../../../search/presentation/screens/search_results_screen.dart';

class HomeTypeHeaderWidget extends StatelessWidget {
  const HomeTypeHeaderWidget({
    super.key,
    required this.headerText,
    required this.typeName,
  });

  final String headerText;
  final String typeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DelayedDisplay(
          delay: const Duration(microseconds: 600),
          child: Text(headerText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => SearchResultsBloc(),
                  child: SearchResultsScreen(
                    typeName: "cake",
                  ),
                ),
              ),
            );
            // todo : navigate to SearchResultsScreen
          },
          icon: const Icon(
            Icons.arrow_forward_sharp,
          ),
        ),
      ],
    );
  }
}
