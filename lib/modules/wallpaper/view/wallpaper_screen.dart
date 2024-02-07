import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:math' show pi;

import '../../../config/remote/collection_reference.dart';
import '../../../shared/gradient_border/gradient_border.dart';
import '../../protected_image/view/protected_image_builder.dart';
import '../helper/remote_image_downloader.dart';
import '../model/wallpaper_model.dart';
import 'widgets/wallpaper_shimmer_loader.dart';

const _linearGradient = LinearGradient(
  transform: GradientRotation(147 * pi / 180),
  begin: Alignment.bottomRight,
  end: Alignment.topRight,
  colors: [
    Color(0xBF434343),
    Color(0x00434343),
  ],
);
const _glassGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0x2AFFFFFF),
    Color(0x8AFFFFFF),
    Color(0x2AFFFFFF),
  ],
);

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({
    super.key,
    required this.wallpaperModel,
  });

  final WallpaperModel wallpaperModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
        children: [
          ProtectedImageBuilder(
            imageRef: WallpaperImageRef.large(wallpaperId: wallpaperModel.id),
            imageBuilder: (context, imageUrl) {
              return SizedBox.expand(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            final RemoteImageDownloader imageDownloader =
                                RemoteImageDownloaderImpl(
                              client: Client(),
                            );
                            imageDownloader.download(imageUrl: imageUrl);
                          },
                          child: const Text('Download'),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            loadingBuilder: (context) {
              return ProtectedImageBuilder(
                imageUrl: wallpaperModel.imageUrlSmall,
                imageRef: WallpaperImageRef.small(
                  wallpaperId: wallpaperModel.id,
                ),
                loadingBuilder: (context) => const SizedBox.expand(
                  child: WallpaperShimmerLoader(),
                ),
                imageBuilder: (context, imageUrl) {
                  return SizedBox.expand(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (_, __) => const WallpaperShimmerLoader(),
                      errorWidget: (_, __, ___) =>
                          const WallpaperShimmerLoader(),
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 55,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton.filled(
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                      Colors.black,
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFFE6E6E6),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category',
                          style: GoogleFonts.workSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.72,
                            color: const Color(0xFFCCCCCC),
                          ),
                        ),
                        Text(
                          'Ai Art Style',
                          style: GoogleFonts.workSans(
                            fontSize: 16.952,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1.017,
                            color: const Color(0xFFE6E6E6),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: _linearGradient,
                            border: const GradientBorder(
                              gradient: _glassGradient,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Whoo Ho, Letsgo',
                                  style: GoogleFonts.workSans(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.48,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF0A0A0A),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        '🔥 Trending',
                                        style: GoogleFonts.workSans(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.48,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton.filled(
                          style: const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                              Colors.black,
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xFFE6E6E6),
                            ),
                            maximumSize: MaterialStatePropertyAll(
                              Size(34, 34),
                            ),
                            minimumSize: MaterialStatePropertyAll(
                              Size(34, 34),
                            ),
                            iconSize: MaterialStatePropertyAll(18),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline_outlined,
                          ),
                        ),
                        const SizedBox(height: 20),
                        IconButton.filled(
                          style: const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                              Color(0xFFE6E6E6),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xFFF5582A),
                            ),
                            maximumSize: MaterialStatePropertyAll(
                              Size(47, 47),
                            ),
                            minimumSize: MaterialStatePropertyAll(
                              Size(47, 47),
                            ),
                            iconSize: MaterialStatePropertyAll(22),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.file_download_outlined,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
