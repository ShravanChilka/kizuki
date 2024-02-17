import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum _ButtonType { text, icon }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onTap,
  })  : _buttonType = _ButtonType.text,
        icon = null;

  const PrimaryButton.icon({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : _buttonType = _ButtonType.icon;

  final VoidCallback? onTap;
  final String title;
  final _ButtonType _buttonType;
  final Widget? icon;

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
        child: Row(
          children: [
            if (_buttonType == _ButtonType.icon)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: icon ?? const SizedBox.shrink(),
              ),
            Text(
              title,
              style: GoogleFonts.inter(
                color: const Color(0xFFE5E5E5),
                fontSize: 9.789,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
