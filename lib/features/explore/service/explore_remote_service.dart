import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../config/remote/collection_reference.dart';
import '../../wallpaper/model/wallpaper_model.dart';
import '../model/explore_filter.dart';

typedef ExploreCollection = CollectionReference<WallpaperModel>;

abstract class ExploreRemoteService {
  ExploreCollection getExloreCollection(ExploreFilter filter);
}

class ExploreRemoteServiceImpl implements ExploreRemoteService {
  const ExploreRemoteServiceImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  @override
  ExploreCollection getExloreCollection(
    ExploreFilter filter,
  ) {
    return firestore
        .collection(FirestoreCollectionReference.wallpapers)
        .withConverter(
          fromFirestore: (doc, _) => WallpaperModel.fromMap(doc.data()!),
          toFirestore: (model, _) => model.toMap(),
        );
  }
}
