import 'package:flutter/material.dart';

import 'widgets/category_wallpaper_header.dart';
import 'widgets/category_wallpaper_list.dart';

class CategoryWallpaperScreen extends StatelessWidget {
  const CategoryWallpaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: CategoryWallpaperHeader(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 34),
          ),
          SliverToBoxAdapter(
            child: CategoryWallpaperList(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 34),
          ),
        ],
      ),
    );
  }
}
