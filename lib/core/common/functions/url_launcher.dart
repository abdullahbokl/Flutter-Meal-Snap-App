import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_constants.dart';
import '../enums.dart';

Future<void> launchUrlMethod(String url) async {
  final uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      AppConstants.showToast(
        message: 'Could not launch',
        state: ToastStates.error,
      );
    }
  } catch (e) {
    AppConstants.showToast(
      message: 'Could not launch',
      state: ToastStates.error,
    );
    log(e.toString());
  }
}
