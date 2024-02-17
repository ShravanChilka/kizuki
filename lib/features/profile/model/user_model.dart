import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  const UserModel._({
    this.name,
    this.avatarUrl,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel._(
      name: user.displayName,
      avatarUrl: user.photoURL,
    );
  }

  final String? name;
  final String? avatarUrl;
}
