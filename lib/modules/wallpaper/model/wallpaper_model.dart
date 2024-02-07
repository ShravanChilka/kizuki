import 'wallpaper_view_detail.dart';

class WallpaperModel {
  const WallpaperModel({
    required this.id,
    required this.categoryId,
    this.viewDetail,
    this.imageUrlSmall,
    this.imageUrlLarge,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> map) {
    return WallpaperModel(
      id: map['id'] as String,
      categoryId: map['categoryId'] as String,
      viewDetail: map.containsKey('viewDetail')
          ? WallpaperViewDetail.fromMap(
              map['viewDetail'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  final String id;
  final String categoryId;
  final String? imageUrlSmall;
  final String? imageUrlLarge;
  final WallpaperViewDetail? viewDetail;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryId': categoryId,
      'viewDetail': viewDetail?.toMap(),
    };
  }

  WallpaperModel copyWith({
    String? imageUrlSmall,
    String? imageUrlLarge,
  }) {
    return WallpaperModel(
      id: id,
      categoryId: categoryId,
      imageUrlSmall: imageUrlSmall ?? this.imageUrlSmall,
      imageUrlLarge: imageUrlLarge ?? this.imageUrlLarge,
    );
  }

  @override
  String toString() {
    return 'WallpaperModel(id: $id, categoryId: $categoryId, imageUrlSmall: $imageUrlSmall, imageUrlLarge: $imageUrlLarge, viewDetail: $viewDetail)';
  }
}
