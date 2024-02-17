import 'package:flutter/material.dart';

import '../../../../wallpaper/view/widgets/wallpaper_card_shimmer_loader.dart';

class CategoryWallpaperShimmerList extends StatelessWidget {
  const CategoryWallpaperShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 99 / 176,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (_, __) => const WallpaperCardShimmerLoader(),
    );
  }
}
