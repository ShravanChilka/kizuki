import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../wallpaper/model/wallpaper_model.dart';
import '../../view_model/category_wallpaper_view_model.dart';
import 'category_wallpaper_list_item.dart';
import 'category_wallpaper_shimmer_list.dart';

class CategoryWallpaperList extends StatelessWidget {
  const CategoryWallpaperList({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<WallpaperModel>(
      query: context
          .read<CategoryWallpaperViewModel>()
          .categoryWallpaperCollection,
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) return const CategoryWallpaperShimmerList();

        final list = snapshot.docs;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 99 / 176,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index].data();
              return CategoryWallpaperListItem(
                wallpaperModel: item,
                onTap: () => context
                    .read<CategoryWallpaperViewModel>()
                    .wallaperClickEvent(wallpaperModel: item),
              );
            },
          ),
        );
      },
    );
  }
}
