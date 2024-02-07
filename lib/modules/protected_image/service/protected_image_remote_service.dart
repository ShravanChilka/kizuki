import 'package:firebase_storage/firebase_storage.dart';

abstract class ProtectedImageRemoteService {
  Future<String> downloadImageUrl(String ref);
}

class ProtectedImageRemoteServiceImpl implements ProtectedImageRemoteService {
  ProtectedImageRemoteServiceImpl({
    required this.storage,
  });

  final FirebaseStorage storage;

  @override
  Future<String> downloadImageUrl(String ref) async {
    return storage.ref(ref).getDownloadURL();
  }
}
