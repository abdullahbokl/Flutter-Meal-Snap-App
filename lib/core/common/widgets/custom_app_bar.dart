import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'custom_text_widget.dart';

PreferredSizeWidget customAppBar({
  required title,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.white,
    iconTheme: const IconThemeData(
      color: AppColors.primary,
    ),
    title: CustomTextWidget(
      text: title,
      style: AppStyles.font24TelmaBold,
    ),
  );
}
