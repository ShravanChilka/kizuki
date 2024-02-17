import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/category_view_model.dart';
import 'category_shimmer_list.dart';
import 'category_shimmer_loader.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder(
      query: context.read<CategoryViewModel>().categoryCollection,
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) return const CategoryShimmerList();
        return SliverList.separated(
          itemCount: snapshot.docs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          itemBuilder: (context, index) {
            final item = snapshot.docs[index].data();
            return GestureDetector(
              onTap: () => context
                  .read<CategoryViewModel>()
                  .categoryClickEvent(categoryModel: item),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl ?? '',
                placeholder: (_, __) => const CategoryShimmerLoader(),
                errorWidget: (_, __, ___) => const CategoryShimmerLoader(),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
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
  }
}
