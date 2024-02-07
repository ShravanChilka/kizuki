import 'package:flutter/cupertino.dart';

import '../../category/view/category_page.dart';
import '../../explore/view/explore_page.dart';
import '../../profile/view/profile_screen.dart';

enum NavBarItem {
  home(
    toolTip: 'Home',
    svgImagePath: 'assets/icons/home_icon.svg',
    screen: ExplorePage(),
  ),
  categories(
    toolTip: 'Categories',
    svgImagePath: 'assets/icons/category_icon.svg',
    screen: CategoryPage(),
  ),
  favourites(
    toolTip: 'Favourites',
    svgImagePath: 'assets/icons/heart_icon.svg',
    screen: SizedBox(),
  ),
  profile(
    toolTip: 'Profile',
    svgImagePath: 'assets/icons/profile_icon.svg',
    screen: ProfileScreen(),
  ),
  ;

  const NavBarItem({
    required this.toolTip,
    required this.svgImagePath,
    required this.screen,
  });
  final String toolTip;
  final String svgImagePath;
  final Widget screen;
}
