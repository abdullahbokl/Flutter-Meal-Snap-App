import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_snap/core/common/widgets/custom_text_widget.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

import '../../../data/models/search_list_tile_model.dart';

class SearchCustomListTile extends StatelessWidget {
  const SearchCustomListTile({
    super.key,
    required this.item,
    this.onTap,
  });

  final SearchListTileModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: AppStyles.primaryBoxDecoration,
            child: ListTile(
              onTap: onTap,
              leading: Container(
                  width: constraints.maxWidth * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(item.image),
                    ),
                  )),
              trailing: const Icon(Icons.arrow_right_alt),
              title: CustomTextWidget(
                text: item.name,
                style: AppStyles.font16SatoshiBold.copyWith(
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          );
        },
      ),
    );
  }
}
