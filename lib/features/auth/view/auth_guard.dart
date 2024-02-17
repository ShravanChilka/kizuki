import 'package:flutter/material.dart';
import 'sign_in_view.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}
