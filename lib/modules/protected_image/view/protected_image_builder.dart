import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/protected_image_remote_service.dart';
import '../view_model/protected_image_view_model.dart';

class ProtectedImageBuilder extends StatelessWidget {
  const ProtectedImageBuilder({
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
      create: (context) => ProtectedImageViewModel(
        imageUrl: imageUrl,
        ref: imageRef,
        remoteService: ProtectedImageRemoteServiceImpl(
          storage: FirebaseStorage.instance,
        ),
      ),
      builder: (context, child) {
        return Consumer<ProtectedImageViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) return loadingBuilder.call(context);
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
