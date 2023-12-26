import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/nav_bar_cubit.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavBarCubit navBarCubit = getIt();
    return Center(
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return PersistentTabView(
            context,
            controller: navBarCubit.persistentTabController,
            screens: navBarCubit.nabBarScreens,
            items: navBarCubit.navBarsItems,
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            hideNavigationBarWhenKeyboardShows: true,
            popAllScreensOnTapOfSelectedTab: true,
            navBarStyle: NavBarStyle.style6,
          );
        },
      ),
    );
  }
}
