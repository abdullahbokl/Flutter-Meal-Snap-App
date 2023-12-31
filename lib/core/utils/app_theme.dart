import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Satoshi',
    primarySwatch: Colors.blue,
    primaryColor: Colors.redAccent,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Telma',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.redAccent,
      ),
    ),
  );
}
