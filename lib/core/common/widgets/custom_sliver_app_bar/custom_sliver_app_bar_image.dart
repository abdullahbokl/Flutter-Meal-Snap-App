import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/recipe/recipe_model.dart';

class CustomSliverAppBarImage extends StatelessWidget {
  const CustomSliverAppBarImage({
    super.key,
    required this.expandedHeight,
    required this.shrinkOffset,
    required this.info,
  });

  final double expandedHeight;
  final double shrinkOffset;
  final RecipeInfoModel info;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (1 - shrinkOffset / expandedHeight),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: info.image!,
            height: 285.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
