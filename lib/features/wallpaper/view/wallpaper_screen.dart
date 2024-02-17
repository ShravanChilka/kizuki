import 'package:flutter/material.dart';

import '../../../shared/component/button/back_icon_button.dart';
import 'widgets/download_icon_button.dart';
import 'widgets/favourite_icon_button.dart';
import 'widgets/wallpaper_category_text.dart';
import 'widgets/wallpaper_image.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: Stack(
        children: [
          SizedBox.expand(
            child: WallpaperImage(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 55,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackIconButton(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WallpaperCategoryText(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FavouriteIconButton(),
                        SizedBox(height: 20),
                        DownloadIconButton(),
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
