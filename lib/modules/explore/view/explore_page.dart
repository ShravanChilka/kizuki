import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/explore_remote_service.dart';
import '../view_model/explore_view_model.dart';
import 'explore_screen.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreViewModel(
        remoteService: ExploreRemoteServiceImpl(
          firestore: FirebaseFirestore.instance,
        ),
      ),
      builder: (context, child) => const ExploreScreen(),
    );
  }
}
