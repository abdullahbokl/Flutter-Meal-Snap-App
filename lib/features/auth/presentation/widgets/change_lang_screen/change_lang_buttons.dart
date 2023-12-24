import 'package:flutter/material.dart';

import '../../../../../core/blocs_cubits/app_lang_cubit/app_lang_cubit.dart';
import '../../../../../core/common/enums.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/service_locator.dart';

class ChangeLangButtons extends StatelessWidget {
  const ChangeLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final appLangCubit = getIt<AppLangCubit>();

    return Row(
      children: [
        CustomButton(
          text: 'English',
          onPressed: () {
            appLangCubit.changeLocale(
              languageCode: AppLanguagesCodes.en,
            );
          },
          width: 140,
          backgroundColor: AppColors.black,
        ),
        const Spacer(),
        CustomButton(
          text: 'العربية',
          onPressed: () {
            appLangCubit.changeLocale(
              languageCode: AppLanguagesCodes.ar,
            );
          },
          width: 140,
          backgroundColor: AppColors.black,
        ),
      ],
    );
  }
}
