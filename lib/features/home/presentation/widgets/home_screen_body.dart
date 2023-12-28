import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/models/home_body_model.dart';
import '../widgets/home_types_tab_bar.dart';
import 'home_custom_message_widget.dart';
import 'home_food_viewer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
    required this.homeBodyModel,
  }) : super(key: key);

  final HomeBodyModel homeBodyModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Gap(30),
          const HomeCustomMessageWidget(),
          const Gap(20),
          const HomeTypesTabBar(),
          const Gap(10),
          HomeFoodViewer(homeBodyModel: homeBodyModel),
        ],
      ),
    );
  }
}
