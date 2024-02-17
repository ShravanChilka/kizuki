import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../config/remote/collection_reference.dart';
import '../../../wallpaper/model/wallpaper_model.dart';
import '../../category/model/category_model.dart';

typedef CategoryWallpaperCollection = Query<WallpaperModel>;

abstract class CategoryWallpaperRemoteService {
  CategoryWallpaperCollection getCategoryWallpaperCollection({
    required CategoryModel categoryModel,
  });
}

class CategoryWallpaperRemoteServiceImpl
    implements CategoryWallpaperRemoteService {
  const CategoryWallpaperRemoteServiceImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  @override
  CategoryWallpaperCollection getCategoryWallpaperCollection({
    required CategoryModel categoryModel,
  }) {
    return firestore.collection(FirestoreCollectionReference.wallpapers).where(
      'categoryIds',
      arrayContainsAny: [categoryModel.id],
    ).withConverter<WallpaperModel>(
      fromFirestore: (doc, _) => WallpaperModel.fromMap(doc.data()!),
      toFirestore: (model, _) => model.toMap(),
    );
  }
}
