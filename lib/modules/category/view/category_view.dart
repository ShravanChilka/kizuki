import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/gradient_border/gradient_border.dart';
import 'widgets/category_list_view.dart';

const _glassGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0x1AFFFFFF),
    Color(0x3BFFFFFF),
    Color(0x1AFFFFFF),
  ],
);

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Categories',
                      style: GoogleFonts.workSans(
                        fontSize: 48.452,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -2.907,
                      ),
                    ),
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
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 34),
          ),
          const CategoryListView(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 34),
          ),
        ],
      ),
    );
  }
}
