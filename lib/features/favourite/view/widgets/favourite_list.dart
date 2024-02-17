import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../wallpaper/model/wallpaper_model.dart';
import '../../view_model/favourite_view_model.dart';
import 'favourite_shimmer_list.dart';
import 'favourite_wallpaper_list_item.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<WallpaperModel>(
      query: context.read<FavouriteViewModel>().favouriteCollection,
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) return const FavouriteShimmerList();

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
              return FavouriteListItem(
                wallpaperModel: item,
                onTap: () => context
                    .read<FavouriteViewModel>()
                    .wallaperClickEvent(wallpaperModel: item),
              );
            },
          ),
        );
      },
    );
  }
}
