import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../config/route/router.dart';
import '../service/auth_remote_service.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required AuthRemoteService remoteService,
  }) : _remoteService = remoteService;

  final AuthRemoteService _remoteService;

  bool get isAuthenticated => _remoteService.isAuthenticated;

  void continueWithAppleClickEvent() async {
    try {
      await _remoteService.signInWithApple();
      ApplicationRouter.router.pushReplacement('/home');
    } catch (e, s) {
      log('continueWithAppleClickEvent', error: e, stackTrace: s);
    }
  }

  void continueWithGoogleClickEvent() async {
    try {
      await _remoteService.signInWithGoogle();
      ApplicationRouter.router.pushReplacement('/home');
    } catch (e, s) {
      log('continueWithGoogleClickEvent', error: e, stackTrace: s);
    }
  }

  void skipClickEvent() async {
    try {
      await _remoteService.signInAnonymously();
      ApplicationRouter.router.pushReplacement('/home');
    } catch (e, s) {
      log('skipClickEvent', error: e, stackTrace: s);
    }
  }

  void signOutClickEvent() async {
    try {
      await _remoteService.signOut();
      ApplicationRouter.router.pushReplacement('/');
    } catch (e, s) {
      log('signOutClickEvent', error: e, stackTrace: s);
    }
  }
}
