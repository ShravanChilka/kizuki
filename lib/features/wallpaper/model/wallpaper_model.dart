import 'wallpaper_view_detail.dart';

class WallpaperModel {
  const WallpaperModel({
    required this.id,
    this.categoryIds,
    this.imageUrlSmall,
    this.imageUrlLarge,
    this.viewDetail,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> map) {
    return WallpaperModel(
      id: map['id'] as String,
      categoryIds: map.containsKey('categoryIds')
          ? List<String>.from((map['categoryIds'] as List))
          : null,
      imageUrlSmall: map.containsKey('imageUrlSmall')
          ? map['imageUrlSmall'] as String
          : null,
      imageUrlLarge: map.containsKey('imageUrlLarge')
          ? map['imageUrlLarge'] as String
          : null,
      viewDetail: map.containsKey('viewDetail')
          ? WallpaperViewDetail.fromMap(
              map['viewDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  final String id;
  final List<String>? categoryIds;
  final String? imageUrlSmall;
  final String? imageUrlLarge;
  final WallpaperViewDetail? viewDetail;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryIds': categoryIds,
      'imageUrlSmall': imageUrlSmall,
      'imageUrlLarge': imageUrlLarge,
      'viewDetail': viewDetail?.toMap(),
    };
  }

  WallpaperModel copyWith({
    List<String>? categoryIds,
    String? imageUrlSmall,
    String? imageUrlLarge,
  }) {
    return WallpaperModel(
      id: id,
      categoryIds: categoryIds ?? this.categoryIds,
      imageUrlSmall: imageUrlSmall ?? this.imageUrlSmall,
      imageUrlLarge: imageUrlLarge ?? this.imageUrlLarge,
      viewDetail: viewDetail,
    );
  }

  @override
  String toString() {
    return ''
        'WallpaperModel(id: $id, '
        'categoryIds: $categoryIds, '
        'imageUrlSmall: $imageUrlSmall, '
        'imageUrlLarge: $imageUrlLarge, '
        'viewDetail: $viewDetail)';
  }
}
