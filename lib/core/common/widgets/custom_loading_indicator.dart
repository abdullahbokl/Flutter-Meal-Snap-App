import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
        backgroundColor: Colors.black12,
        strokeWidth: 5.0,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
