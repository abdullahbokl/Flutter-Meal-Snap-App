import 'package:flutter/material.dart';

abstract class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(
    String routeName, {
    required Object arguments,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushReplacementNamed(
    String routeName, {
    required Object arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    required Object arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static Future<dynamic> push(Widget page) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => page));
  }

  static Future<dynamic> pushReplacement(Widget page) {
    return navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static Future<dynamic> pushAndRemoveUntil(Widget page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static void pop() {
    return navigatorKey.currentState!.pop();
  }

  static removeAllAndPushNamed(String routeName) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!.pushNamed(routeName);
  }

  static removeAllAndPush(Widget page) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => page));
  }
}
