import 'package:cached_network_image/cached_network_image.dart';

class CacheNetworkImageWidget extends CachedNetworkImage {
  CacheNetworkImageWidget({
    super.key,
    super.cacheKey,
    required super.imageUrl,
    super.fit,
    super.imageBuilder,
    super.errorWidget,
    super.placeholder,
    super.height,
    super.width,
  });
}
