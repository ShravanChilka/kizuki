import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/nav_bar_item.dart';

class HomeViewModel extends ChangeNotifier {
  NavBarItem _selected = NavBarItem.home;
  NavBarItem get selected => _selected;

  void navBarChangeEvent(NavBarItem item) {
    _selected = item;
    notifyListeners();
  }

  @override
  void dispose() {
    log('dispose', name: '$runtimeType');
    super.dispose();
  }
}
