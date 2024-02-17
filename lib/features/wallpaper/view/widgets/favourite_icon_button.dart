import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/component/button/circle_icon_button.dart';
import '../../view_model/wallpaper_view_model.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      onTap: context.read<WallpaperViewModel>().addOrRemoveFavouriteClickEvent,
      backgroundColor: const Color(0xFFE6E6E6),
      size: 34,
      icon: const Icon(
        Icons.favorite_outline_outlined,
        color: Colors.black,
        size: 14,
      ),
    );
  }
}
