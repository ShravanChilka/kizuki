import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../config/remote/collection_reference.dart';
import '../model/category_model.dart';

typedef CategoryCollection = CollectionReference<CategoryModel>;

abstract class CategoryRemoteService {
  CategoryCollection getCategoryCollection();
}

class CategoryRemoteServiceImpl implements CategoryRemoteService {
  const CategoryRemoteServiceImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  @override
  CategoryCollection getCategoryCollection() {
    return firestore
        .collection(FirestoreCollectionReference.categories)
        .withConverter(
          fromFirestore: (doc, _) => CategoryModel.fromMap(doc.data()!),
          toFirestore: (model, _) => model.toMap(),
        );
  }
}
