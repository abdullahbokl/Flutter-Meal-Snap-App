import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/recipe_info_screen_arguments.dart';
import '../bloc/recipe_info_bloc.dart';
import '../widgets/recipe_info_screen_body.dart';

class RecipeInfoScreen extends StatelessWidget {
  final RecipeInfoScreenArguments arguments;

  const RecipeInfoScreen({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<RecipeInfoBloc>()..add(LoadRecipeInfoEvent(id: arguments.id)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<RecipeInfoBloc, RecipeInfoState>(
            builder: (context, state) {
              if (state is RecipeInfoLoadingState) {
                return const CustomLoadingIndicator();
              } else if (state is RecipeInfoSuccessState) {
                return RecipeInfoScreenBody(dataModel: state.dataModel);
              } else if (state is RecipeInfoFailureState) {
                return CustomErrorWidget(message: state.message);
              } else {
                return const CustomErrorWidget(message: 'Something went wrong');
              }
            },
          ),
        ),
      ),
    );
  }
}
