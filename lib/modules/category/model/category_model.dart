import 'category_view_detail.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.viewDetail,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      viewDetail: map.containsKey('viewDetail')
          ? CategoryViewDetail.fromMap(
              map['viewDetail'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  final String id;
  final String title;
  final String imageUrl;
  final CategoryViewDetail? viewDetail;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'viewDetail': viewDetail?.toMap(),
    };
  }
}
