// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import '../service/protected_image_remote_service.dart';

class ProtectedImageViewModel extends ChangeNotifier {
  ProtectedImageViewModel({
    this.imageUrl,
    required this.ref,
    required this.remoteService,
  }) {
    _init();
  }

  final String ref;
  String? imageUrl;
  bool isLoading = true;
  final ProtectedImageRemoteService remoteService;

  void _init() async {
    try {
      imageUrl = imageUrl ?? await remoteService.downloadImageUrl(ref);
      log('ref : $ref \n imageUrl : $imageUrl');
    } catch (e, s) {
      log('_init', error: e, stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
