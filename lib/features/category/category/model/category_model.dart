// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  const CategoryModel({
    required this.id,
    this.title,
    this.imageUrl,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      title: map['title'] != null ? map['title'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  final String id;
  final String? title;
  final String? imageUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() => ''
      'CategoryModel(id: $id, '
      'title: $title, '
      'imageUrl: $imageUrl)';
}
