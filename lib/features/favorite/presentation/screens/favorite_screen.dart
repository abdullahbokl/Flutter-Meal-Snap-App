import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/favourite_screen_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
          title: AppStrings.appName,
        ),
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box(AppStrings.hiveFavoriteBox).listenable(),
          builder: (context, box, child) {
            if (box.isEmpty) {
              return const CustomErrorWidget(
                message: AppStrings.favoriteNoFavoriteRecipe,
                iconData: CupertinoIcons.heart_fill,
              );
            }
            return FavouriteScreenBody(
              box: box,
            );
          },
        ),
      ),
    );
  }
}
