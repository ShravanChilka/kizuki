import 'package:flutter/material.dart';

import '../../../../config/route/router.dart';
import '../model/category_model.dart';
import '../service/category_remote_service.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel({
    required this.remoteService,
  }) {
    _init();
  }

  final CategoryRemoteService remoteService;
  late final CategoryCollection _collection;
  CategoryCollection get categoryCollection => _collection;

  void _init() {
    _collection = remoteService.getCategoryCollection();
  }

  void categoryClickEvent({required CategoryModel categoryModel}) {
    AppRouter.instance.push(
      '/categories/${categoryModel.id}',
      extra: categoryModel,
    );
  }
}
