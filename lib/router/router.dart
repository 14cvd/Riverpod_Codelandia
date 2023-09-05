import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_codelandia/constant/constRouteString.dart';
import 'package:riverpod_codelandia/screen/mainScreen.dart';
import 'package:riverpod_codelandia/screen/splashScreen.dart';
import 'package:riverpod_codelandia/screen/userScreen.dart';

sealed class CustomRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final routers = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: ConstStringRoute.splash,
    routes: [
      GoRoute(
        path: ConstStringRoute.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: ConstStringRoute.userList,
        builder: (context, state) => const UserScreen(),
      ),
      GoRoute(
        path: ConstStringRoute.splash,
        builder: (context, state) => const SplashScreen(),
      )
    ],
  );
}
