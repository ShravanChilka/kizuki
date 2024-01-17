import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApplicationRouter {
  static GoRouter get router => _router;
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Container(),
      ),
    ],
  );
}
