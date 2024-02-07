import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'package:google_fonts/google_fonts.dart';

import '../../gradient_border/gradient_border.dart';

const _linearGradient = LinearGradient(
  transform: GradientRotation(147 * pi / 180),
  begin: Alignment.bottomRight,
  end: Alignment.topRight,
  colors: [
    Color(0xBF434343),
    Color(0x00434343),
  ],
);
const _glassGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0x2AFFFFFF),
    Color(0x8AFFFFFF),
    Color(0x2AFFFFFF),
  ],
);

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.178),
      child: Ink(
        decoration: BoxDecoration(
          gradient: _linearGradient,
          borderRadius: BorderRadius.circular(4.178),
          border: const GradientBorder(
            gradient: _glassGradient,
            width: 0.544,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            color: const Color(0xFFE5E5E5),
            fontSize: 9.789,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
