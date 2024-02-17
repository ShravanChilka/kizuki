import 'package:flutter/material.dart';

import '../../../shared/component/image/cache_network_image_widget.dart';
import 'storage_image.dart';

class StorageCacheImage extends StatelessWidget {
  const StorageCacheImage({
    super.key,
    this.cacheKey,
    required this.imageRef,
    this.imageUrl,
    required this.loadingBuilder,
    this.errorWidget,
    required this.imageBuilder,
    this.fit,
    this.height,
    this.width,
  });

  final String imageRef;
  final String? imageUrl;
  final String? cacheKey;
  final Widget Function(BuildContext context) loadingBuilder;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final Widget Function(
    BuildContext context,
    ImageProvider<Object> imageProvider,
    String imageUrl,
  ) imageBuilder;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return StorageImage(
      imageRef: imageRef,
      loadingBuilder: loadingBuilder,
      imageBuilder: (BuildContext context, String imageUrl) {
        return CacheNetworkImageWidget(
          cacheKey: cacheKey,
          imageUrl: imageUrl,
          errorWidget: errorWidget,
          fit: fit,
          height: height,
          width: width,
          imageBuilder: (context, imageProvider) => imageBuilder.call(
            context,
            imageProvider,
            imageUrl,
          ),
          placeholder: (context, _) => loadingBuilder.call(context),
        );
      },
    );
  }
}
