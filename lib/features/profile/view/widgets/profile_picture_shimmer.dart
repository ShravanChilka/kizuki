import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePictureShimmer extends StatelessWidget {
  const ProfilePictureShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0x1AFFFFFF),
      highlightColor: const Color(0x3BFFFFFF),
      child: Container(
        height: 90,
        width: 90,
        decoration: const BoxDecoration(
          color: Color(0x1AFFFFFF),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
