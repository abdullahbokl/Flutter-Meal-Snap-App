import 'package:flutter/material.dart';

import '../widgets/change_lang_screen/change_lang_screen_body.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChangeLangScreenBody(),
    );
  }
}
