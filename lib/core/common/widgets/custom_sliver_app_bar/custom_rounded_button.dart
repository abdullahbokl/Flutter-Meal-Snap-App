import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    this.icon,
    this.child,
    required this.onTap,
    this.height,
    this.width,
    this.iconSize,
  });

  final Widget? child;
  final IconData? icon;
  final VoidCallback onTap;

  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    if ((child != null && icon != null) || (child == null && icon == null)) {
      throw Exception("You can't use both child and icon");
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: child ??
            Icon(
              icon,
              color: Colors.black,
              size: iconSize,
            ),
      ),
    );
  }
}
