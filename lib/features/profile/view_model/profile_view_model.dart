import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/profile_remote_service.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({
    required this.remoteService,
  }) {
    _init();
  }

  final ProfileRemoteService remoteService;
  late final UserModel? _user;
  UserModel? get user => _user;

  void _init() {
    _user = remoteService.currentUser;
  }
}
