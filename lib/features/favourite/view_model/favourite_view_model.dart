import 'package:flutter/material.dart';

import '../../../config/route/router.dart';
import '../../wallpaper/model/wallpaper_model.dart';
import '../service/favourite_remote_service.dart';

class FavouriteViewModel extends ChangeNotifier {
  FavouriteViewModel({
    required this.remoteService,
  }) {
    _init();
  }

  final FavouriteRemoteService remoteService;
  late final FavouriteCollection _collection;
  FavouriteCollection get favouriteCollection => _collection;

  void _init() {
    _collection = remoteService.getFavouriteCollections();
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
