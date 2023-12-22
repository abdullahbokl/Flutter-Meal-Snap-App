import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/service_locator.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _appInit();
  runApp(const MyApp());
}

Future<void> _appInit() async {
  await initServiceLocator();
}
