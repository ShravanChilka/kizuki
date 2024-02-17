import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WallpaperCardShimmerLoader extends StatelessWidget {
  const WallpaperCardShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0x1AFFFFFF),
      highlightColor: const Color(0x3BFFFFFF),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x1AFFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
