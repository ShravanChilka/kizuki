import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

abstract class ProfileRemoteService {
  UserModel? get currentUser;
}

class ProfileRemoteServiceImpl implements ProfileRemoteService {
  const ProfileRemoteServiceImpl({
    required this.firebaseAuth,
  });

  final FirebaseAuth firebaseAuth;

  @override
  UserModel? get currentUser {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return UserModel.fromFirebaseUser(user);
  }
}
