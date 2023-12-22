import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_navigator.dart';

class CustomErrorPage extends StatelessWidget {
  const CustomErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Page Not Found"),
          const Gap(10),
          ElevatedButton(
            onPressed: () {
              AppNavigator.pop();
            },
            child: const Text("Go Back"),
          ),
        ],
      ),
    );
  }
}
