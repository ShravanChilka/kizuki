import 'package:flutter/material.dart';

import '../../../config/route/router.dart';
import '../../wallpaper/model/wallpaper_model.dart';
import '../model/explore_filter.dart';
import '../service/explore_remote_service.dart';

class ExploreViewModel extends ChangeNotifier {
  ExploreViewModel({
    required this.remoteService,
  }) {
    _init();
  }

  final ExploreRemoteService remoteService;
  late final ExploreCollection _collection;
  ExploreCollection get exploreCollection => _collection;

  void exploreWallpaperSelectedEvent(WallpaperModel wallpaperModel) {
    AppRouter.instance.push(
      '/wallpapers/${wallpaperModel.id}',
      extra: wallpaperModel,
    );
  }

  void _init() {
    _collection = remoteService.getExloreCollection(ExploreFilter.latest);
  }
}
