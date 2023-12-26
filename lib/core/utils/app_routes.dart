import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/change_lang_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/send_code_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../common/widgets/custom_error_page.dart';

class Routes {
  static const String initialRoute = '/';
  static const String changeLangScreen = '/changeLangScreen';
  static const String homeScreen = '/homeScreen';

  static const String loginScreen = '/loginScreen';
  static const String sendCodeScreen = '/sendCodeScreen';
  static const String restPasswordScreen = '/restPasswordScreen';
  static const String menuHomeScreen = '/menuHomeScreen';
  static const String addMealScreen = '/addMealScreen';
  static const String profileHomeScreen = '/profileHomeScreen';
  static const String updateProfileScreen = '/updateProfileScreen';
  static const String settingScreen = '/settingScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // Auth
      case Routes.changeLangScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeLangScreen(key: UniqueKey()));
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.sendCodeScreen:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.restPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      // home
      case Routes.homeScreen:
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
