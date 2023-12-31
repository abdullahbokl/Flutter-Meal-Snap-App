import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'custom_back_button.dart';
import 'custom_text_widget.dart';

PreferredSizeWidget customAppBar({
  String? title,
  bool isShowBackButton = false,
  AppBarBottomModel? bottom,
  // PreferredSizeWidget? bottom,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.white,
    iconTheme: const IconThemeData(
      color: AppColors.secondaryColor,
    ),
    leading: isShowBackButton ? const CustomBackButton() : null,
    title: title != null
        ? CustomTextWidget(
            text: title,
            style: AppStyles.font24TelmaBold,
          )
        : null,
    bottom: bottom != null
        ? PreferredSize(
            preferredSize: Size.fromHeight(bottom.height.h),
            child: bottom.child,
          )
        : null,
  );
}

class AppBarBottomModel {
  final double height;
  final Widget child;

  AppBarBottomModel({
    required this.height,
    required this.child,
  });
}
