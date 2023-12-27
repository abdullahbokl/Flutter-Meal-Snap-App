import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/models/food_type_model.dart';
import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class HomeHorizontalFoodListCard extends StatelessWidget {
  const HomeHorizontalFoodListCard({
    super.key,
    required this.items,
  });

  final FoodTypeModel items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // todo : go item details
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => BlocProvider(
        //       create: (context) => RecipeInfoBloc(),
        //       child: RecipeInfo(
        //         id: widget.items.id,
        //       ),
        //     ),
        //   ),
        // );
      },
      child: Container(
          width: 190.w,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(-2, -2),
                blurRadius: 12,
                color: Color.fromRGBO(0, 0, 0, 0.05),
              ),
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 0.10),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  CachedNetworkImage(
                    imageUrl: items.image,
                    fit: BoxFit.cover,
                    height: constraints.maxHeight * 0.6,
                  ),
                  const Gap(10),
                  // title
                  CustomTextWidget(
                    text: items.name,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.r,
                      vertical: 5.r,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: AppStyles.font16SatoshiBold.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                  // ready in
                  CustomTextWidget(
                    text: "Ready in ${items.readyInMinutes} Min",
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.r,
                      vertical: 5.r,
                    ),
                    style: AppStyles.font16SatoshiBold.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Gap(5.r),
                ],
              );
            },
          )),
    );
  }
}
