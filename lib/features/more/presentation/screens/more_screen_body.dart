import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_colors.dart';
import 'package:meal_snap/features/more/presentation/widget/more_app_features.dart';
import 'package:meal_snap/features/more/presentation/widget/more_app_info.dart';

import '../widget/more_sign_out_button.dart';
import '../widget/more_terms_of_use.dart';

class MoreScreenBody extends StatelessWidget {
  const MoreScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.white,
          child: ListView(
            shrinkWrap: true,
            children: const [
              MoreTermsOfUse(),
              MoreAppFeatures(),
              MoreAppInfo(),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: MoreSignOutButton(),
          ),
        ),
      ],
    );
  }
}
