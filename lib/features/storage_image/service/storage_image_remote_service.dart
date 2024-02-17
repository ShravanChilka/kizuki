import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageImageRemoteService {
  Future<String> downloadImageUrl(String ref);
}

class StorageImageRemoteServiceImpl implements StorageImageRemoteService {
  const StorageImageRemoteServiceImpl({
    required this.storage,
  });

  final FirebaseStorage storage;

  @override
  Future<String> downloadImageUrl(String ref) async {
    return storage.ref(ref).getDownloadURL();
  }
}
