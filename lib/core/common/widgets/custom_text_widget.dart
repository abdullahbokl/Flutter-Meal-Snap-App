import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? AppStyles.fontSmall(),
      textDirection: AppConstants.appTextDirection,
    );
  }
}
