import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/blocs_cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/screens/change_lang_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/send_code_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/nav_bar/presentation/screens/nav_bar_screen.dart';
import '../../features/recipe_info/presentation/screens/recipe_info_screen.dart';
import '../../features/search/data/models/search_results_screen_arguments.dart';
import '../../features/search/presentation/screens/search_results_screen.dart';
import '../common/widgets/custom_error_page.dart';
import 'service_locator.dart';

class Routes {
  // splash
  static const String initialRoute = '/a';
  static const String changeLangScreen = '/changeLangScreen';

  // auth
  static const String loginScreen = '/loginScreen';
  static const String sendCodeScreen = '/sendCodeScreen';
  static const String restPasswordScreen = '/restPasswordScreen';

  // nav bar
  static const String navBarScreen = '/navBarScreen';
  static const String homeScreen = '/homeScreen';
  // static const String recipeInfoScreen = '/recipeInfoScreen';
  static const String recipeInfoScreen = '/';
  static const String searchResultsScreen = '/searchResultsScreen';
  static const String searchScreen = '/searchScreen';
  static const String favoriteScreen = '/favoriteScreen';
  static const String moreScreen = '/moreScreen';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // splash
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.changeLangScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeLangScreen(key: UniqueKey()),
        );

      // nav bar
      case Routes.navBarScreen:
        return MaterialPageRoute(
          builder: (_) => const NavBarScreen(),
        );

      // auth
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.sendCodeScreen:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.restPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      // home
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.recipeInfoScreen:
        return MaterialPageRoute(
            builder: (_) => RecipeInfoScreen(
                  id: "1",
                ));

      // search
      case Routes.searchResultsScreen:
        return MaterialPageRoute(
          builder: (_) => SearchResultsScreen(
            args: routeSettings.arguments as SearchResultsScreenArguments,
          ),
        );
      // 404
      default:
        return MaterialPageRoute(builder: (_) => const CustomErrorPage());
    }
  }
}
