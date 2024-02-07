part of 'index.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.title,
    required this.image,
    this.onTap,
  }) : super(key: key);

  final String title;
  final ImageProvider image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Ink(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 13),
            Image(
              image: image,
              width: 20,
              height: 20,
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13.06,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
