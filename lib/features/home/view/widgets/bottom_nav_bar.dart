import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../model/nav_bar_item.dart';
import '../../view_model/home_view_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Selector<HomeViewModel, NavBarItem>(
          selector: (_, viewModel) => viewModel.selected,
          builder: (context, selected, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: NavBarItem.values.map((item) {
                return GestureDetector(
                  onTap: () =>
                      context.read<HomeViewModel>().navBarChangeEvent(item),
                  child: Tooltip(
                    message: item.toolTip,
                    child: CircleAvatar(
                      backgroundColor:
                          item == selected ? Colors.black : Colors.transparent,
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
            );
          },
        ),
      ),
    );
  }
}
