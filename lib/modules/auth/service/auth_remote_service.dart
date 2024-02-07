// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class AuthRemoteService {
  bool get isAuthenticated;
  User? get currentUser;
  Future<void> signInWithGoogle();
  Future<void> signInWithApple();
  Future<void> signInAnonymously();
  Future<void> signOut();
  Future<void> deleteAccount();
}

class AuthRemoteServiceImpl implements AuthRemoteService {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteServiceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  bool get isAuthenticated => firebaseAuth.currentUser != null;

  @override
  Future<void> signInWithApple() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    await firebaseAuth.signInWithCredential(oauthCredential);
  }

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    if (googleSignIn.currentUser != null) {
      await googleSignIn.signOut();
    }
    await firebaseAuth.signOut();
  }

  @override
  Future<void> deleteAccount() async {
    await firebaseAuth.currentUser?.delete();
  }

  @override
  Future<void> signInAnonymously() async {
    await firebaseAuth.signInAnonymously();
  }

  @override
  User? get currentUser => firebaseAuth.currentUser;
}

String _generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(
    length,
    (_) => charset[random.nextInt(charset.length)],
  ).join();
}

String _sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
