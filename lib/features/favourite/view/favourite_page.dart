import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/favourite_remote_service.dart';
import '../view_model/favourite_view_model.dart';
import 'favourite_screen.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteViewModel(
        remoteService: FavouriteRemoteServiceImpl(
          firestore: FirebaseFirestore.instance,
          auth: FirebaseAuth.instance,
        ),
      ),
      child: const FavouriteScreen(),
    );
  }
}
