import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../shared/gradient_border/gradient_border.dart';
import '../view_model/auth_view_model.dart';
import 'widgets/index.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Sign In, Switch Style :)',
                style: GoogleFonts.workSans(
                  fontSize: 14.59,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.symmetric(horizontal: 36),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x3DFFFFFF),
                      Colors.transparent,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(54),
                    topRight: Radius.circular(54),
                  ),
                  border: GradientBorder(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x8AFFFFFF),
                        Color(0x2AFFFFFF),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 96),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: SocialLoginButton(
                        title: 'Continue with Apple',
                        image: const AssetImage('assets/icons/apple_icon.png'),
                        onTap: context
                            .read<AuthViewModel>()
                            .continueWithAppleClickEvent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: SocialLoginButton(
                        title: 'Continue with Google',
                        image: const AssetImage('assets/icons/google_icon.png'),
                        onTap: context
                            .read<AuthViewModel>()
                            .continueWithGoogleClickEvent,
                      ),
                    ),
                    const SizedBox(height: 34),
                    SkipButton(
                      onTap: context.read<AuthViewModel>().skipClickEvent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '©XYZ.Walls 2.0.2(3)',
                      style: GoogleFonts.workSans(
                        letterSpacing: -0.5,
                        fontSize: 7.9,
                        color: const Color(0xFF5C5C5C),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              const Positioned(
                top: -46,
                left: 0,
                right: 0,
                child: LogoWidget(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
