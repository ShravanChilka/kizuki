import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/remote/collection_reference.dart';
import '../../wallpaper/model/wallpaper_model.dart';

typedef FavouriteCollection = CollectionReference<WallpaperModel>;

abstract class FavouriteRemoteService {
  FavouriteCollection getFavouriteCollections();
  Future<void> addOrRemoveFromFavourite(WallpaperModel wallpaperModel);
  Stream<bool> watchFavouriteStatus(WallpaperModel wallpaperModel);
}

class FavouriteRemoteServiceImpl implements FavouriteRemoteService {
  const FavouriteRemoteServiceImpl({
    required this.firestore,
    required this.auth,
  });

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  @override
  FavouriteCollection getFavouriteCollections() {
    return firestore
        .collection(FirestoreCollectionReference.userData)
        .doc(auth.currentUser?.uid)
        .collection(FirestoreCollectionReference.favourites)
        .withConverter(
      fromFirestore: (snapshot, _) {
        return WallpaperModel.fromMap(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toMap();
      },
    );
  }

  @override
  Future<void> addOrRemoveFromFavourite(WallpaperModel wallpaperModel) async {
    final ref = firestore
        .collection(FirestoreCollectionReference.userData)
        .doc(auth.currentUser?.uid)
        .collection(FirestoreCollectionReference.favourites)
        .doc(wallpaperModel.id);
    final doc = await ref.get();
    if (doc.exists) {
      return await ref.delete();
    }
    return await ref.set(wallpaperModel.toMap());
  }

  @override
  Stream<bool> watchFavouriteStatus(WallpaperModel wallpaperModel) {
    final ref = firestore
        .collection(FirestoreCollectionReference.userData)
        .doc(auth.currentUser?.uid)
        .collection(FirestoreCollectionReference.favourites)
        .doc(wallpaperModel.id);
    return ref.snapshots().map((snapshot) => snapshot.exists);
  }
}
