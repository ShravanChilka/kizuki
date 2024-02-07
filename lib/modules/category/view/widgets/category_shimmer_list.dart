import 'package:flutter/material.dart';

class CategoryShimmerList extends StatelessWidget {
  const CategoryShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      itemBuilder: (_, __) => const CircularProgressIndicator(),
    );
  }
}
