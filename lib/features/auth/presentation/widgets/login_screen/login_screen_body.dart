import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:meal_snap/core/common/animation/animation.dart';

import 'login_app_bar.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0.sh,
      child: CustomScrollView(
        slivers: [
          const LoginAppBar(),
          SliverGap(0.1.sh),
          const SliverToBoxAdapter(
            child: DelayedDisplay(child: LoginForm()),
          ),
          SliverGap(0.1.sh),
        ],
      ),
    );
  }
}
