import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/remote/collection_reference.dart';
import '../../../storage_image/view/storage_cache_image.dart';
import '../../../wallpaper/model/wallpaper_model.dart';
import '../../../wallpaper/view/widgets/wallpaper_card_shimmer_loader.dart';
import '../../view_model/explore_view_model.dart';

class ExploreListItem extends StatelessWidget {
  const ExploreListItem({
    super.key,
    required this.wallpaperModel,
  });

  final WallpaperModel wallpaperModel;

  @override
  Widget build(BuildContext context) {
    return StorageCacheImage(
      cacheKey: WallpaperImageRef.small(wallpaperId: wallpaperModel.id),
      imageRef: WallpaperImageRef.small(wallpaperId: wallpaperModel.id),
      loadingBuilder: (context) => const WallpaperCardShimmerLoader(),
      imageBuilder: (context, imageProvider, imageUrl) {
        return GestureDetector(
          onTap: () => context
              .read<ExploreViewModel>()
              .exploreWallpaperSelectedEvent(wallpaperModel),
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
