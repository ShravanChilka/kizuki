import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerLoader extends StatelessWidget {
  const CategoryShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0x1AFFFFFF),
      highlightColor: const Color(0x3BFFFFFF),
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: const Color(0x1AFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
