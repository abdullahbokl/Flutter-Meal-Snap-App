import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/animation/animation.dart';
import '../../../../core/common/models/food_type_model.dart';
import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_styles.dart';

class HomeVerticalFoodListCard extends StatelessWidget {
  const HomeVerticalFoodListCard({
    super.key,
    required this.foodTypeModel,
  });

  final FoodTypeModel foodTypeModel;

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(microseconds: 600),
      child: InkWell(
        onTap: () {
          // todo : navigate to item details
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => BlocProvider(
          //       create: (context) => RecipeInfoBloc(),
          //       child: RecipeInfo(
          //         id: widget.meal.id,
          //       ),
          //     ),
          //   ),
          // );
        },
        child: Container(
          height: 90.h,
          margin: const EdgeInsets.all(8),
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
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: foodTypeModel.image,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth * 0.35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(10),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text: foodTypeModel.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.font16SatoshiBold.copyWith(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const Gap(10),
                          CustomTextWidget(
                            text:
                                "Ready in ${foodTypeModel.readyInMinutes} Min",
                            style: AppStyles.font16SatoshiBold.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
