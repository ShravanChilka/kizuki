import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/auth/view/auth_guard.dart';
import '../../features/auth/view_model/auth_view_model.dart';
import '../../features/category/category/model/category_model.dart';
import '../../features/category/category_wallpaper/view/category_wallpaper_page.dart';
import '../../features/home/view/home_page.dart';
import '../../features/profile/view/profile_page.dart';
import '../../features/wallpaper/model/wallpaper_model.dart';
import '../../features/wallpaper/view/wallpaper_page.dart';

class AppRouter {
  static GoRouter get instance => _router;
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/',
    // initialLocation: '/profile',
    redirect: (context, state) {
      final isAuthenticated = context.read<AuthViewModel>().isAuthenticated;
      if (!isAuthenticated) {
        return '/auth';
        // return '/profile';
      }
      return null;
    },
    routes: [
      GoRoute(
        name: 'auth',
        path: '/auth',
        builder: (context, state) => const AuthGuard(),
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: 'wallpaper',
            path: 'wallpapers/:wallpaperId',
            builder: (context, state) {
              final wallpaperModel = (state.extra is WallpaperModel)
                  ? state.extra as WallpaperModel
                  : WallpaperModel(
                      id: state.pathParameters['wallpaperId'].toString(),
                    );
              return WallpaperPage(
                wallpaperModel: wallpaperModel,
              );
            },
          ),
          GoRoute(
            name: 'categories',
            path: 'categories/:categoryId',
            builder: (context, state) {
              final categoryModel = state.extra as CategoryModel;
              return CategoryWallpaperPage(
                categoryModel: categoryModel,
              );
            },
          ),
          GoRoute(
            name: 'profile',
            path: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
