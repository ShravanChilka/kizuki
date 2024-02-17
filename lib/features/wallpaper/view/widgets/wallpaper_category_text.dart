import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' show pi;

import '../../../../shared/gradient_border/gradient_border.dart';

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

class WallpaperCategoryText extends StatelessWidget {
  const WallpaperCategoryText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: GoogleFonts.workSans(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.72,
            color: const Color(0xFFCCCCCC),
          ),
        ),
        Text(
          'Ai Art Style',
          style: GoogleFonts.workSans(
            fontSize: 16.952,
            fontWeight: FontWeight.w400,
            letterSpacing: -1.017,
            color: const Color(0xFFE6E6E6),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: _linearGradient,
            border: const GradientBorder(
              gradient: _glassGradient,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  'Whoo Ho, Letsgo',
                  style: GoogleFonts.workSans(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 10.66,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF0A0A0A),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      child: Text(
                        '🔥 Trending',
                        style: GoogleFonts.workSans(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 9.01,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
