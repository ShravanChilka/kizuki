import 'package:flutter/material.dart';

import '../../../config/remote/collection_reference.dart';
import '../../favourite/service/favourite_remote_service.dart';
import '../helper/remote_image_downloader.dart';
import '../model/wallpaper_model.dart';

class WallpaperViewModel extends ChangeNotifier {
  WallpaperViewModel({
    required this.wallpaperModel,
    required this.imageDownloader,
    required this.favouriteRemoteService,
  });

  WallpaperModel wallpaperModel;

  final RemoteImageDownloader imageDownloader;
  final FavouriteRemoteService favouriteRemoteService;

  void updateImageUrlLarge(String imageUrl) {
    wallpaperModel = wallpaperModel.copyWith(imageUrlLarge: imageUrl);
    notifyListeners();
  }

  void updateImageUrlSmall(String imageUrl) {
    wallpaperModel = wallpaperModel.copyWith(imageUrlSmall: imageUrl);
    notifyListeners();
  }

  String get imageRefLarge =>
      WallpaperImageRef.large(wallpaperId: wallpaperModel.id);

  String get imageRefSmall =>
      WallpaperImageRef.small(wallpaperId: wallpaperModel.id);

  void wallpaperDownloadClickEvent() {
    if (wallpaperModel.imageUrlLarge != null) {
      imageDownloader.download(imageUrl: wallpaperModel.imageUrlLarge!);
    }
  }

  void addOrRemoveFavouriteClickEvent() {
    favouriteRemoteService.addOrRemoveFromFavourite(wallpaperModel);
  }
}
