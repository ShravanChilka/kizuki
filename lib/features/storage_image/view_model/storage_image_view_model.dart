import 'dart:developer';

import 'package:flutter/material.dart';
import '../service/storage_image_remote_service.dart';

class StorageImageViewModel extends ChangeNotifier {
  StorageImageViewModel({
    this.imageUrl,
    required this.ref,
    required this.remoteService,
  }) {
    _init();
  }

  final String ref;
  String? imageUrl;
  final StorageImageRemoteService remoteService;

  void _init() async {
    try {
      imageUrl ??= await remoteService.downloadImageUrl(ref);
      log('ref : $ref \n imageUrl : $imageUrl');
    } catch (e, s) {
      log('_init', error: e, stackTrace: s);
    } finally {
      notifyListeners();
    }
  }
}
