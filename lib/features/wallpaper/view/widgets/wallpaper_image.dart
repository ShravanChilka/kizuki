import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../storage_image/view/storage_cache_image.dart';
import '../../view_model/wallpaper_view_model.dart';
import 'wallpaper_shimmer_loader.dart';

class WallpaperImage extends StatelessWidget {
  const WallpaperImage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WallpaperViewModel>();
    return StorageCacheImage(
      cacheKey: viewModel.imageRefLarge,
      imageRef: viewModel.imageRefLarge,
      imageBuilder: (context, imageProvider, imageUrl) {
        viewModel.updateImageUrlLarge(imageUrl);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      loadingBuilder: (context) {
        return StorageCacheImage(
          cacheKey: viewModel.imageRefSmall,
          imageUrl: viewModel.wallpaperModel.imageUrlSmall,
          imageRef: viewModel.imageRefSmall,
          loadingBuilder: (context) => const SizedBox.expand(
            child: WallpaperShimmerLoader(),
          ),
          imageBuilder: (context, imageProvider, imageUrl) {
            viewModel.updateImageUrlSmall(imageUrl);
            return Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
