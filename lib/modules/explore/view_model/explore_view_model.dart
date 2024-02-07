import 'package:flutter/material.dart';

import '../model/explore_filter.dart';
import '../service/explore_remote_service.dart';

class ExploreViewModel extends ChangeNotifier {
  ExploreViewModel({
    required this.remoteService,
  }) {
    _init();
  }

  final ExploreRemoteService remoteService;
  late final ExploreCollection _collection;
  ExploreCollection get exploreCollection => _collection;

  void _init() {
    _collection = remoteService.getExloreCollection(ExploreFilter.latest);
  }
}
