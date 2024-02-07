import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/remote/collection_reference.dart';
import '../../../../config/route/router.dart';
import '../../../protected_image/view/protected_image_builder.dart';
import '../../../wallpaper/model/wallpaper_model.dart';
import '../../../wallpaper/view/widgets/wallpaper_shimmer_loader.dart';
import '../../view_model/explore_view_model.dart';

class ExploreListView extends StatelessWidget {
  const ExploreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<WallpaperModel>(
      query: context.read<ExploreViewModel>().exploreCollection,
      builder: (context, snapshot, child) {
        final list = snapshot.docs;
        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 99 / 176,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index].data();
            return ProtectedImageBuilder(
              imageRef: WallpaperImageRef.small(wallpaperId: item.id),
              loadingBuilder: (context) => const WallpaperShimmerLoader(),
              imageBuilder: (context, imageUrl) {
                return GestureDetector(
                  onTap: () {
                    ApplicationRouter.router.go(
                      '/home/categories/${item.categoryId}/wallpapers/${item.id}',
                      extra: item.copyWith(imageUrlSmall: imageUrl),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (_, __) => const WallpaperShimmerLoader(),
                    errorWidget: (_, __, ___) => const WallpaperShimmerLoader(),
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
