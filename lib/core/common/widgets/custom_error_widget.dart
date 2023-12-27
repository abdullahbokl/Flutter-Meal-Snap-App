import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/widgets/custom_text_widget.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: CustomTextWidget(
              text: message,
              style: AppStyles.font20SatoshiW500,
            ),
          ),
        ],
      ),
    );
  }
}
