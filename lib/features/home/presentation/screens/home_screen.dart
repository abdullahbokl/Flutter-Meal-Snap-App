import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_snap/features/home/presentation/widgets/home_types_tab_bar.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../blocs_cubits/home_bloc.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // getIt<HomeBloc>().add(LoadHomeDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "MealSnap"),
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return HomeTypesTabBar();
          if (state is HomeLoadingState) {
            return const Center(child: CustomLoadingIndicator());
          } else if (state is HomeSuccessState) {
            return HomeScreenBody(homeBodyModel: state.homeBodyModel);
          } else if (state is HomeFailureState) {
            return CustomErrorWidget(message: state.message);
          } else {
            return const CustomErrorWidget(message: "Something went wrong");
          }
        },
      ),
    );
  }
}
