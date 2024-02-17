part of 'index.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Ink(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 44,
        ),
        decoration: BoxDecoration(
          gradient: _linearGradient,
          borderRadius: BorderRadius.circular(4),
          border: const GradientBorder(
            gradient: _glassGradient,
            width: 0.4,
          ),
        ),
        child: Text(
          'Skip',
          style: GoogleFonts.inter(
            fontSize: 11.28,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFE6E6E6),
          ),
        ),
      ),
    );
  }
}
