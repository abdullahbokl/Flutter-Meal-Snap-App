import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_snap/core/utils/app_styles.dart';

import '../../../../../core/common/animation/animation.dart';

class CategoryTile extends StatelessWidget {
  final String text;
  final String image;

  const CategoryTile({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: DelayedDisplay(
        delay: const Duration(microseconds: 600),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: AppStyles.primaryBoxDecoration,
          child: ListTile(
              leading: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(image),
                      fit: BoxFit.cover,
                    ),
                  )),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => BlocProvider(
                //       create: (context) => SearchResultsBloc(),
                //       child: SearchResults(
                //         id: text,
                //       ),
                //     ),
                //   ),
                // );
              },
              title: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_right_alt)),
        ),
      ),
    );
  }
}
