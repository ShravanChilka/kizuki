import 'package:flutter/material.dart';

import '../../../../../config/remote/collection_reference.dart';
import '../../../../storage_image/view/storage_cache_image.dart';
import '../../../../wallpaper/model/wallpaper_model.dart';
import '../../../../wallpaper/view/widgets/wallpaper_card_shimmer_loader.dart';

class CategoryWallpaperListItem extends StatelessWidget {
  const CategoryWallpaperListItem({
    super.key,
    required this.wallpaperModel,
    this.onTap,
  });

  final WallpaperModel wallpaperModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return StorageCacheImage(
      cacheKey: WallpaperImageRef.small(wallpaperId: wallpaperModel.id),
      imageRef: WallpaperImageRef.small(wallpaperId: wallpaperModel.id),
      imageUrl: wallpaperModel.imageUrlSmall,
      loadingBuilder: (context) => const WallpaperCardShimmerLoader(),
      imageBuilder: (context, imageProvider, imageUrl) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
