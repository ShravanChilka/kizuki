import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/di/injector.dart';
import 'modules/auth/view_model/auth_view_model.dart';
import 'modules/home/view_model/home_view_model.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => injecter.get<AuthViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (context) => injecter.get<HomeViewModel>(),
        ),
      ],
      child: child,
    );
  }
}
