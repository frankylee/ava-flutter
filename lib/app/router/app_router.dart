import 'package:ava_flutter/app/router/app_routes.dart';
import 'package:ava_flutter/pages/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppRoute.home.path,
  navigatorKey: _rootNavigatorKey,
  routes: _routes,
);

final _routes = [
  GoRoute(
    name: AppRoute.home.name,
    path: AppRoute.home.path,
    pageBuilder: (context, state) => const MaterialPage(
      child: HomePage(),
    ),
  ),
];
