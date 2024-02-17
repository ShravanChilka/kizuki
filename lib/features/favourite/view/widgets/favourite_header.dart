import 'package:flutter/material.dart';

import '../../../../shared/gradient_border/gradient_border.dart';
import 'favourite_header_title.dart';

const _glassGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0x1AFFFFFF),
    Color(0x3BFFFFFF),
    Color(0x1AFFFFFF),
  ],
);

class FavouriteHeader extends StatelessWidget {
  const FavouriteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 238,
          padding: const EdgeInsets.only(left: 30),
          margin: const EdgeInsets.only(right: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(132),
            ),
            border: GradientBorder(
              gradient: _glassGradient,
              width: 1,
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xFF202020),
                Colors.transparent,
              ],
            ),
          ),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: FavouriteHeaderTitle(),
          ),
        ),
        const Positioned(
          right: 20,
          bottom: 0,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFF5592A),
            foregroundImage: AssetImage(
              'assets/default_avatar.png',
            ),
          ),
        )
      ],
    );
  }
}
