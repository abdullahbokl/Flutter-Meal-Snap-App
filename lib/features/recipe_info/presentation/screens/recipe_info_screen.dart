import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../core/utils/service_locator.dart';
import '../bloc/recipe_info_bloc.dart';
import '../widgets/recipe_info_screen_body.dart';

class RecipeInfoScreen extends StatelessWidget {
  final String id;

  const RecipeInfoScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<RecipeInfoBloc>()..add(LoadRecipeInfoEvent(id: id)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<RecipeInfoBloc, RecipeInfoState>(
          builder: (context, state) {
            if (state is RecipeInfoLoadingState) {
              return const CustomLoadingIndicator();
            } else if (state is RecipeInfoSuccessState) {
              return RecipeInfoScreenBody(
                equipment: state.equipment,
                info: state.recipe,
                nutrient: state.nutrient,
                similarList: state.similar,
              );
            } else if (state is RecipeInfoFailureState) {
              return CustomErrorWidget(message: state.message);
            } else {
              return const CustomErrorWidget(message: 'Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
