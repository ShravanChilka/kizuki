import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/category_remote_service.dart';
import '../view_model/category_view_model.dart';
import 'category_screen.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel(
        remoteService: CategoryRemoteServiceImpl(
          firestore: FirebaseFirestore.instance,
        ),
      ),
      child: const CategoryScreen(),
    );
  }
}
