import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../shared/component/button/back_icon_button.dart';
import '../../../shared/component/button/primary_button.dart';
import '../../../shared/component/button/secondary_button.dart';
import '../../auth/view_model/auth_view_model.dart';
import 'widgets/profile_name_text.dart';
import 'widgets/profile_picture_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 1,
                center: Alignment(-1, -0.6),
                colors: [
                  Color(0X66C95500),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 34, left: 34, right: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 34),
                const BackIconButton(),
                const SizedBox(height: 92),
                Text(
                  'Settings',
                  style: GoogleFonts.workSans(
                    fontSize: 41.07.sp,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 32),
                const Row(
                  children: [
                    ProfilePictureImage(),
                    SizedBox(width: 20),
                    ProfileNameText(),
                  ],
                ),
                SizedBox(height: 34.h),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton.icon(
                        onTap: () {},
                        title: 'Share App',
                        icon: const Icon(
                          Icons.share,
                          size: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: SecondaryButton.icon(
                        onTap: () {},
                        title: 'Contact Us',
                        icon: const Icon(
                          Icons.note_alt_outlined,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton.icon(
                        onTap: () {},
                        title: 'Privacy Policy',
                        icon: const Icon(
                          Icons.security,
                          size: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: SecondaryButton.icon(
                        onTap: () {},
                        title: 'Rate Our App',
                        icon: const Icon(
                          Icons.star_border_purple500_rounded,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton.icon(
                        onTap: () {},
                        title: 'Liked Wallpapers',
                        icon: const Icon(
                          Icons.security,
                          size: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: PrimaryButton.icon(
                        onTap: context.read<AuthViewModel>().signOutClickEvent,
                        title: 'Logout',
                        icon: const Icon(
                          Icons.logout,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
