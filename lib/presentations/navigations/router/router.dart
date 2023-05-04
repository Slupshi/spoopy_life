import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';
import 'package:spoopy_life/presentations/navigations/widgets/desktop_navigation.dart';
import 'package:spoopy_life/presentations/navigations/widgets/mobile_navigation.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/home",
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        if (kIsWeb) {
          return const Scaffold(
            body: Center(
              child: Text("Build on Web"),
            ),
          );
        }
        if (defaultTargetPlatform == TargetPlatform.android) {
          return MobileNavigation(child: child);
        } else if (defaultTargetPlatform == TargetPlatform.windows) {
          return DesktopNavigation(child: child);
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Not Implemented"),
            ),
          );
        }
      },
      routes: <GoRoute>[
        for (var route in routes)
          GoRoute(
            path: route.path,
            pageBuilder: (context, state) => NoTransitionPage(
              child: route.child,
            ),
          ),
      ],
    ),
  ],
);
