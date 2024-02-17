class CategoryViewDetail {
  const CategoryViewDetail({
    required this.totalViewCount,
    required this.viewedByUsers,
  });

  factory CategoryViewDetail.fromMap(Map<String, dynamic> map) {
    return CategoryViewDetail(
      totalViewCount: map['totalViewCount'] as int,
      viewedByUsers: List<String>.from(
        (map['viewedByUsers'] as List<dynamic>),
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
