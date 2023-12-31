import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_strings.dart';
import 'more_screen_body.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: customAppBar(
          title: AppStrings.appName,
        ),
        body: const MoreScreenBody(),
      ),
    );
  }
}
