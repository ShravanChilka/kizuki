import 'package:flutter/material.dart';

import 'category_shimmer_loader.dart';

class CategoryShimmerList extends StatelessWidget {
  const CategoryShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      itemBuilder: (_, __) => const CategoryShimmerLoader(),
    );
  }
}
