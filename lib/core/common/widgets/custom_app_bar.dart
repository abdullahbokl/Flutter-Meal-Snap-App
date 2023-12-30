import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/widgets/custom_back_button.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'custom_text_widget.dart';

PreferredSizeWidget customAppBar({
  required String title,
  bool isShowBackButton = false,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.white,
    iconTheme: const IconThemeData(
      color: AppColors.secondaryColor,
    ),
    // back button color should be black
    leading: isShowBackButton ? CustomBackButton() : null,
    title: CustomTextWidget(
      text: title,
      style: AppStyles.font24TelmaBold,
    ),
  );
}
