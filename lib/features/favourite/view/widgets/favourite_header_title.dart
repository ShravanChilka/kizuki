import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteHeaderTitle extends StatelessWidget {
  const FavouriteHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Favourites',
      style: GoogleFonts.workSans(
        fontSize: 48.452,
        fontWeight: FontWeight.w500,
        letterSpacing: -2.907,
      ),
    );
  }
}
