import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/change_lang_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/send_code_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../common/widgets/custom_error_page.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String changeLang = '/changeLang';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String restPassword = '/restPassword';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String setting = '/setting';
  static const String changePassword = '/changePassword';
  static const String home = '/home';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      // Auth
      case Routes.changeLang:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.restPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      // home
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // case Routes.menuHome:
      //   return MaterialPageRoute(builder: (_) => const MenuHomeScreen());
      // case Routes.addMeal:
      //   return MaterialPageRoute(builder: (_) => const AddMealScreen());
      //
      // case Routes.profileHome:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case Routes.updateProfile:
      //   return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      // case Routes.setting:
      //   return MaterialPageRoute(builder: (_) => const SettingsScreen());
      // case Routes.changePassword:
      //   return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      //

      // 404
      default:
        return MaterialPageRoute(builder: (_) => const CustomErrorPage());
    }
  }
}
