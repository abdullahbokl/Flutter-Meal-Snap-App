import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../models/recipe/recipe_model.dart';
import 'custom_app_bar_icons.dart';
import 'custom_sliver_app_bar_footer.dart';
import 'custom_sliver_app_bar_image.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final RecipeInfoModel info;

  CustomSliverAppBar({
    required this.expandedHeight,
    required this.info,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final appBarSize = maxExtent - shrinkOffset;
    final proportion = 2 - (maxExtent / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: maxExtent),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          // background image
          CustomSliverAppBarImage(
            expandedHeight: expandedHeight,
            info: info,
            shrinkOffset: shrinkOffset,
          ),
          // app bar
          CustomAppBarIcons(
            expandedHeight: expandedHeight,
            shrinkOffset: shrinkOffset,
            info: info,
          ),
          // footer
          CustomSliverAppBarFooter(
            expandedHeight: expandedHeight,
            info: info,
            shrinkOffset: shrinkOffset,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration(
        stretchTriggerOffset: maxExtent,
      );

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
