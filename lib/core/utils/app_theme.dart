import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
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
