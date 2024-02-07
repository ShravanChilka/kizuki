import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.178),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.178),
          color: const Color(0xFFF5592A),
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
