import 'package:flutter/material.dart';

import 'widgets/favourite_header.dart';
import 'widgets/favourite_list.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: FavouriteHeader(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 34),
          ),
          SliverToBoxAdapter(
            child: FavouriteList(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 34),
          ),
        ],
      ),
    );
  }
}
