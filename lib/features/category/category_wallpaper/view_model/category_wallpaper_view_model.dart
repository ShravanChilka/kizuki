import 'package:flutter/material.dart';

import '../../../../config/route/router.dart';
import '../../../wallpaper/model/wallpaper_model.dart';
import '../../category/model/category_model.dart';
import '../service/category_wallpaper_remote_service.dart';

class CategoryWallpaperViewModel extends ChangeNotifier {
  CategoryWallpaperViewModel({
    required this.categoryModel,
    required this.remoteService,
  }) {
    _init();
  }

  final CategoryModel categoryModel;
  final CategoryWallpaperRemoteService remoteService;

  late final CategoryWallpaperCollection _collection;
  CategoryWallpaperCollection get categoryWallpaperCollection => _collection;

  void _init() {
    _collection = remoteService.getCategoryWallpaperCollection(
      categoryModel: categoryModel,
    );
  }

  void wallaperClickEvent({
    required WallpaperModel wallpaperModel,
  }) {
    AppRouter.instance.push(
      '/wallpapers/${wallpaperModel.id}',
      extra: wallpaperModel,
    );
  }
}
