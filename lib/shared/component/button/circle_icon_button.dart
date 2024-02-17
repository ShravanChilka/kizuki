import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    this.onTap,
    required this.backgroundColor,
    required this.icon,
    required this.size,
  });

  final VoidCallback? onTap;
  final Color backgroundColor;
  final double size;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          height: size,
          width: size,
          child: icon,
        ),
      ),
    );
  }
}
