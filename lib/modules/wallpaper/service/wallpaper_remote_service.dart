import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../config/remote/collection_reference.dart';
import '../model/wallpaper_model.dart';
import '../model/wallpaper_request_model.dart';

abstract class WallpaperRemoteService {
  Future<WallpaperModel?> getWallpaper(WallpaperRequestModel request);
}

class WallpaperRemoteServiceImpl implements WallpaperRemoteService {
  WallpaperRemoteServiceImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  @override
  Future<WallpaperModel?> getWallpaper(WallpaperRequestModel request) {
    return firestore
        .collection(FirestoreCollectionReference.wallpapers)
        .doc(request.wallpaperId)
        .get()
        .then(
          (snap) => snap.exists ? WallpaperModel.fromMap(snap.data()!) : null,
        );
  }
}
