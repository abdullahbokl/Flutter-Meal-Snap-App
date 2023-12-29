import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/common/models/recipe/extended_ingredient.dart';
import '../../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../recipe_info_item_card.dart';

class RecipeInfoIngredientView extends StatelessWidget {
  const RecipeInfoIngredientView({
    super.key,
    required this.ingredient,
  });

  final ExtendedIngredient ingredient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _buildModalBottomSheet(context),
      child: RecipeInfoItemCard(
        name: ingredient.name!,
        imageUrl:
            "${AppStrings.recipeInfoIngredientImageUrl}${ingredient.image}",
      ),
    );
  }

  Future<dynamic> _buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      // height: 500.h,

      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // image
              Container(
                clipBehavior: Clip.antiAlias,
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://spoonacular.com/cdn/ingredients_500x500/${ingredient.image}",
                ),
              ),
              const SizedBox(height: 20),
              // name
              CustomTextWidget(
                text: ingredient.name!.toUpperCase(),
                style: AppStyles.font20SatoshiW500,
              ),
              // name clean
              if (ingredient.name != ingredient.nameClean)
                CustomTextWidget(
                  text: "(${ingredient.nameClean})",
                  style: AppStyles.font12SatoshiW100.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              const Gap(10),
              _BottomSheetBody(ingredient: ingredient),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomSheetBody extends StatelessWidget {
  const _BottomSheetBody({
    required this.ingredient,
  });

  final ExtendedIngredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // aisle
        _BuildRichText(
          text: "${AppStrings.recipeInfoIngredientAisle}: ",
          value: ingredient.aisle!,
        ),
        const Gap(10),
        // consistency
        _BuildRichText(
          text: "${AppStrings.recipeInfoConsistency}: ",
          value: ingredient.consistency!,
        ),
        const Gap(10),
        // amount
        _BuildRichText(text: "Amount: ", value: ingredient.original!),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _BuildRichText extends StatelessWidget {
  const _BuildRichText({
    required this.text,
    required this.value,
  });

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: AppStyles.font16SatoshiBold.copyWith(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: AppStyles.font16SatoshiBold.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
