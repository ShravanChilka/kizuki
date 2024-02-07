class WallpaperViewDetail {
  const WallpaperViewDetail({
    required this.totalViewCount,
    required this.viewedByUsers,
  });
  factory WallpaperViewDetail.fromMap(Map<String, dynamic> map) {
    return WallpaperViewDetail(
      totalViewCount: map['totalViewCount'] as int,
      viewedByUsers: List<String>.from(
        (map['viewedByUsers'] as List<String>),
      ),
    );
  }

  final int totalViewCount;
  final List<String> viewedByUsers;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalViewCount': totalViewCount,
      'viewedByUsers': viewedByUsers,
    };
  }
}
