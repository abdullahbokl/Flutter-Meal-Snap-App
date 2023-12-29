import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_colors.dart';

import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/models/recipe_info_screen_data_model.dart';

class RecipeInfoStatusCard extends StatelessWidget {
  const RecipeInfoStatusCard({
    super.key,
    required this.dataModel,
  });

  final RecipeInfoScreenModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: VerticalSection(
            text: "Ready in",
            value: "${dataModel.info.readyInMinutes} Min",
          ),
        ),
        const VerticalDivider(),
        Flexible(
          flex: 1,
          child: VerticalSection(
            text: "Serving",
            value: "${dataModel.info.servings}",
          ),
        ),
        const VerticalDivider(),
        Flexible(
          flex: 1,
          child: VerticalSection(
            text: "Price/Servings",
            value: "${dataModel.info.pricePerServing}",
          ),
        )
      ],
    );
  }
}

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 2,
      color: Theme.of(context).primaryColor,
    );
  }
}

class VerticalSection extends StatelessWidget {
  const VerticalSection({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(
          text: value,
          style: AppStyles.font20SatoshiW500.copyWith(
            color: AppColors.black,
          ),
        ),
        CustomTextWidget(
          text: text,
          style: AppStyles.font12SatoshiW100.copyWith(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
