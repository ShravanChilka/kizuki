import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWallpaperHeaderTitle extends StatelessWidget {
  const CategoryWallpaperHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Wallpapers',
      style: GoogleFonts.workSans(
        fontSize: 48.452,
        fontWeight: FontWeight.w500,
        letterSpacing: -2.907,
      ),
    );
  }
}
