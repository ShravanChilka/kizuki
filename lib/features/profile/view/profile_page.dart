import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/profile_remote_service.dart';
import '../view_model/profile_view_model.dart';
import 'profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(
        remoteService: ProfileRemoteServiceImpl(
          firebaseAuth: FirebaseAuth.instance,
        ),
      ),
      child: const ProfileScreen(),
    );
  }
}
