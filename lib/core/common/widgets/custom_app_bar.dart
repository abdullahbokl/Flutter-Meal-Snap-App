import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'custom_text_widget.dart';

PreferredSizeWidget customAppBar({
  required title,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: CustomTextWidget(
      text: title,
      style: AppStyles.fontLargeBold().copyWith(
        color: AppColors.primary,
      ),
    ),
  );
}
