import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.style,
    this.padding,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        style: style ?? AppStyles.font16SatoshiBold,
        textDirection: AppConstants.appTextDirection,
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
