import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/component/button/circle_icon_button.dart';
import '../../view_model/wallpaper_view_model.dart';

class DownloadIconButton extends StatelessWidget {
  const DownloadIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      onTap: context.read<WallpaperViewModel>().wallpaperDownloadClickEvent,
      backgroundColor: const Color(0xFFF5582A),
      size: 48,
      icon: const Icon(
        Icons.file_download_outlined,
        color: Color(0xFFE6E6E6),
        size: 22,
      ),
    );
  }
}
