import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/category_view_model.dart';
import 'category_shimmer_list.dart';
import 'category_shimmer_loader.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder(
      query: context.read<CategoryViewModel>().categoryCollection,
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) const CategoryShimmerList();
        return SliverList.separated(
          itemCount: snapshot.docs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 5),
          itemBuilder: (context, index) {
            final item = snapshot.docs[index].data();
            return GestureDetector(
              onTap: () {},
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                placeholder: (_, __) => const CategoryShimmerLoader(),
                errorWidget: (_, __, ___) => const CategoryShimmerLoader(),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
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
