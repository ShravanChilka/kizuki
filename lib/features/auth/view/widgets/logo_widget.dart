part of 'index.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/logo.png'),
      width: 95,
      height: 97,
    );
  }
}
