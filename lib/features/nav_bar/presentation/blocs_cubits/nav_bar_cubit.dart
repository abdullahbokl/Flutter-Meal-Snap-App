import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favorite_screen/presentation/screens/favorite_screen.dart';
import '../../../home/presentation/screens/home_recipe_screen.dart';
import '../../../more/presentation/screens/more_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  final persistentTabController = PersistentTabController(initialIndex: 0);

  final List<Widget> nabBarScreens = [
    const HomeRecipeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const MoreScreen(),
  ];
  final List<PersistentBottomNavBarItem> navBarsItems = [
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      iconSize: 20,
      icon: const Icon(
        CupertinoIcons.home,
      ),
      activeColorPrimary: Colors.redAccent,
      title: ("Home"),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      iconSize: 20,
      icon: const Icon(
        CupertinoIcons.search,
      ),
      activeColorPrimary: Colors.redAccent,
      title: ("Search"),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      icon: const Icon(
        CupertinoIcons.heart_fill,
      ),
      iconSize: 20,
      activeColorPrimary: Colors.redAccent,
      title: ("Favorite"),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      icon: Icon(
        Icons.list,
      ),
      iconSize: 20,
      activeColorPrimary: Colors.redAccent,
      title: ("More"),
    ),
  ];

  void changeIndex(int index) {
    emit(NavBarIndex(index: index));
  }
}
