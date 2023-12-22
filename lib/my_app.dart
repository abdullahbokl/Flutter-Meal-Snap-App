import 'package:flutter/material.dart';

import 'core/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.intitlRoute,
      onGenerateRoute: AppRoutes.generateRoute,
      title: 'Meal Snap',
    );
  }
}
