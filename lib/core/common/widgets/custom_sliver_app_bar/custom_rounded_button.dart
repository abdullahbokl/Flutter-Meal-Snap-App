import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.height,
    this.width,
    this.iconSize,
  });

  final IconData icon;
  final VoidCallback onTap;

  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
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
        child: Icon(
          icon,
          color: Colors.black,
          size: iconSize,
        ),
      ),
    );
  }
}
