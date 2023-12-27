import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onSubmitted});

  final VoidCallback? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        onSubmitted: (value) {},
        decoration: InputDecoration(
          hintText: "Search Recipes..",
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSubmitted,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Colors.black.withOpacity(.5),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
