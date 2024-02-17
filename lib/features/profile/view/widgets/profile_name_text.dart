import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../view_model/profile_view_model.dart';

class ProfileNameText extends StatelessWidget {
  const ProfileNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning,',
          style: GoogleFonts.workSans(
            fontSize: 10.sp,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF3E475E),
          ),
        ),
        const SizedBox(height: 4),
        Selector<ProfileViewModel, UserModel?>(
          selector: (_, viewModel) => viewModel.user,
          builder: (context, user, child) {
            return Text(
              user?.name ?? '',
              style: GoogleFonts.workSans(
                fontSize: 25.45.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
                color: const Color(0xFFF6F6F8),
              ),
            );
          },
        ),
      ],
    );
  }
}
