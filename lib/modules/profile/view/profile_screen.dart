import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/component/button/primary_button.dart';
import '../../auth/view_model/auth_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryButton(
        title: 'Log out',
        onTap: context.read<AuthViewModel>().signOutClickEvent,
      ),
    );
  }
}
