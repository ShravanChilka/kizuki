import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../category/model/category_model.dart';
import '../service/category_wallpaper_remote_service.dart';
import '../view_model/category_wallpaper_view_model.dart';
import 'category_wallpaper_screen.dart';

class CategoryWallpaperPage extends StatelessWidget {
  const CategoryWallpaperPage({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryWallpaperViewModel>(
      create: (context) => CategoryWallpaperViewModel(
        categoryModel: categoryModel,
        remoteService: CategoryWallpaperRemoteServiceImpl(
          firestore: FirebaseFirestore.instance,
        ),
      ),
      child: const CategoryWallpaperScreen(),
    );
  }
}
