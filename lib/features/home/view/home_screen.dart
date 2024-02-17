import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../model/nav_bar_item.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Selector<HomeViewModel, NavBarItem>(
        selector: (_, viewModel) => viewModel.selected,
        builder: (context, selected, child) {
          return Stack(
            children: [
              SizedBox.expand(
                child: selected.screen,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 200,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: const Color(0x1C999999),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 21,
                      sigmaY: 21,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: NavBarItem.values.map((item) {
                        return GestureDetector(
                          onTap: () => context
                              .read<HomeViewModel>()
                              .navBarChangeEvent(item),
                          child: Tooltip(
                            message: item.toolTip,
                            child: CircleAvatar(
                              backgroundColor: item == selected
                                  ? Colors.black
                                  : Colors.transparent,
                              radius: 16,
                              child: SvgPicture.asset(
                                item.svgImagePath,
                                height: 14,
                                width: 14,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
