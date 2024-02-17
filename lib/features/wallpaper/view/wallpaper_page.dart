import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../favourite/service/favourite_remote_service.dart';
import '../helper/remote_image_downloader.dart';
import '../model/wallpaper_model.dart';
import '../view_model/wallpaper_view_model.dart';
import 'wallpaper_screen.dart';

class WallpaperPage extends StatelessWidget {
  const WallpaperPage({
    super.key,
    required this.wallpaperModel,
  });

  final WallpaperModel wallpaperModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WallpaperViewModel(
          wallpaperModel: wallpaperModel,
          imageDownloader: FlutterImageDownloaderImpl(),
          favouriteRemoteService: FavouriteRemoteServiceImpl(
            firestore: FirebaseFirestore.instance,
            auth: FirebaseAuth.instance,
          )),
      child: const WallpaperScreen(),
    );
  }
}
