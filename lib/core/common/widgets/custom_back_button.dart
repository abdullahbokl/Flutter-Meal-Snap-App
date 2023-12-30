import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_navigator.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => AppNavigator.pop(),
      color: AppColors.black,
    );
  }
}
