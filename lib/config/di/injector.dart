import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/service/auth_remote_service.dart';
import '../../features/auth/view_model/auth_view_model.dart';
import '../../features/category/category/service/category_remote_service.dart';
import '../../features/explore/service/explore_remote_service.dart';
import '../../features/home/view_model/home_view_model.dart';
import '../../features/storage_image/service/storage_image_remote_service.dart';
import '../../features/wallpaper/service/wallpaper_remote_service.dart';

final GetIt injecter = GetIt.instance;

Future<void> init() async {
  // View Model
  injecter.registerFactory<AuthViewModel>(
    () => AuthViewModel(
      remoteService: injecter.get(),
    ),
  );
  injecter.registerFactory<HomeViewModel>(
    () => HomeViewModel(),
  );

  // Remote Service
  injecter.registerLazySingleton<AuthRemoteService>(
    () => AuthRemoteServiceImpl(
      firebaseAuth: injecter.get(),
      googleSignIn: injecter.get(),
    ),
  );
  injecter.registerLazySingleton<ExploreRemoteService>(
    () => ExploreRemoteServiceImpl(
      firestore: injecter.get(),
    ),
  );
  injecter.registerLazySingleton<CategoryRemoteService>(
    () => CategoryRemoteServiceImpl(
      firestore: injecter.get(),
    ),
  );
  injecter.registerLazySingleton<WallpaperRemoteService>(
    () => WallpaperRemoteServiceImpl(
      firestore: injecter.get(),
    ),
  );
  injecter.registerLazySingleton<StorageImageRemoteService>(
    () => StorageImageRemoteServiceImpl(
      storage: injecter.get(),
    ),
  );

  // External
  injecter.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  injecter.registerLazySingleton<GoogleSignIn>(
    () => GoogleSignIn(),
  );
  injecter.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  injecter.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );
}
