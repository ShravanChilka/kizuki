import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WallpaperShimmerLoader extends StatelessWidget {
  const WallpaperShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0x1AFFFFFF),
      highlightColor: const Color(0x3BFFFFFF),
      child: Container(
        color: const Color(0x1AFFFFFF),
      ),
    );
  }
}
