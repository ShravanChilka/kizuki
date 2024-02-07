import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerLoader extends StatelessWidget {
  const CategoryShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0x1AFFFFFF),
      highlightColor: const Color(0x3BFFFFFF),
      child: Container(
        height: 100,
        color: const Color(0x1AFFFFFF),
        width: double.maxFinite,
      ),
    );
  }
}
