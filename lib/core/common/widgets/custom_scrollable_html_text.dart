import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

class CustomScrollableHtmlText extends StatelessWidget {
  const CustomScrollableHtmlText({
    super.key,
    required this.htmlString,
  });

  final String htmlString;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppStyles.primaryBoxDecoration.copyWith(
        color: Colors.grey.shade50,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: LimitedBox(
        maxHeight: 150.h,
        child: SingleChildScrollView(
          child: HtmlWidget(
            htmlString,
          ),
        ),
      ),
    );
  }
}
