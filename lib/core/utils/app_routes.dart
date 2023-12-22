import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/change_lang_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/reset_password.dart';
import '../../features/auth/presentation/screens/send_code_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../common/custom_error_page.dart';

abstract class Routes {
  static const String intitlRoute = '/';
  static const String changeLang = '/changeLang';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String restPassword = '/restPassword';
}

abstract class AppRoutes {
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

      // 404
      default:
        return MaterialPageRoute(builder: (_) => const CustomErrorPage());
    }
  }
}
