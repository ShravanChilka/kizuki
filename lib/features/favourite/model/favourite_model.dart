import '../../wallpaper/model/wallpaper_model.dart';

class FavouriteModel {
  const FavouriteModel({
    required this.wallpaperId,
  });

  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      wallpaperId: map['wallpaperId'] as String,
    );
  }
  factory FavouriteModel.fromWallaperModel(WallpaperModel model) {
    return FavouriteModel(
      wallpaperId: model.id,
    );
  }

  final String wallpaperId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wallpaperId': wallpaperId,
    };
  }
}
