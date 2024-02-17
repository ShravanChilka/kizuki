import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/storage_image_remote_service.dart';
import '../view_model/storage_image_view_model.dart';

class StorageImage extends StatelessWidget {
  const StorageImage({
    super.key,
    this.imageUrl,
    required this.imageRef,
    required this.loadingBuilder,
    required this.imageBuilder,
  });

  final String imageRef;
  final String? imageUrl;
  final Widget Function(BuildContext context) loadingBuilder;
  final Widget Function(BuildContext context, String imageUrl) imageBuilder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StorageImageViewModel(
        imageUrl: imageUrl,
        ref: imageRef,
        remoteService: StorageImageRemoteServiceImpl(
          storage: FirebaseStorage.instance,
        ),
      ),
      builder: (context, child) {
        return Consumer<StorageImageViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.imageUrl == null) return loadingBuilder.call(context);
            final downloadImageUrl = viewModel.imageUrl;
            if (downloadImageUrl == null) {
              return loadingBuilder.call(context);
            }
            return imageBuilder.call(context, downloadImageUrl);
          },
        );
      },
    );
  }
}
