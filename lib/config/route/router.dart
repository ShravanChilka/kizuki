import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../modules/auth/view/auth_guard.dart';
import '../../modules/auth/view_model/auth_view_model.dart';
import '../../modules/category/view/category_page.dart';
import '../../modules/home/view/home_page.dart';
import '../../modules/wallpaper/model/wallpaper_model.dart';
import '../../modules/wallpaper/view/wallpaper_screen.dart';

class ApplicationRouter {
  static GoRouter get router => _router;
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    redirect: (context, state) {
      final isAuthenticated = context.read<AuthViewModel>().isAuthenticated;
      if (!isAuthenticated) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        name: 'auth',
        path: '/',
        builder: (context, state) => const AuthGuard(),
        routes: [
          GoRoute(
            name: 'categories',
            path: 'categories/:categoryId',
            builder: (context, state) => const CategoryPage(),
          ),
          GoRoute(
            name: 'home',
            path: 'home',
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                name: 'wallpaper',
                path: 'categories/:categoryId/wallpapers/:wallpaperId',
                builder: (context, state) {
                  log(state.pathParameters.toString(), name: 'pathParameters');
                  final wallpaperModel = (state.extra is WallpaperModel)
                      ? state.extra as WallpaperModel
                      : WallpaperModel(
                          categoryId:
                              state.pathParameters['categoryId'] as String,
                          id: state.pathParameters['wallpaperId'] as String,
                        );
                  log('wallpaperModel : $wallpaperModel');
                  return WallpaperScreen(
                    wallpaperModel: wallpaperModel,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
