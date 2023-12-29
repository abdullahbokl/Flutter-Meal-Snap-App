import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/custom_text_widget.dart';
import '../../../../core/utils/app_styles.dart';

class RecipeInfoItemCard extends StatelessWidget {
  const RecipeInfoItemCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  color: Color.fromRGBO(0, 0, 0, 0.20),
                )
              ],
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: CachedNetworkImageProvider(
                    imageUrl,
                  )),
            )),
        const Gap(10),
        LimitedBox(
          maxWidth: 100.w,
          child: CustomTextWidget(
            text: name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: AppStyles.font12SatoshiW100.copyWith(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
