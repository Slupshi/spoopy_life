import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';

final GoRouter router = GoRouter(
  initialLocation: "/home",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        if (Platform.isAndroid) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("SpoopyLife"),
            ),
            body: Expanded(child: child),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                for (var route in routes)
                  BottomNavigationBarItem(
                    icon: Icon(
                      route.icon,
                      size: route.iconSize,
                    ),
                    label: route.name,
                  ),
              ],
            ),
          );
        } else if (Platform.isWindows) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("SpoopyLife"),
            ),
            body: Row(
              children: [
                Material(
                  color: Colors.amber,
                  child: Column(
                    children: [
                      for (var route in routes)
                        Container(
                          color: ModalRoute.of(context)?.settings.name ==
                                  route.name
                              ? Colors.red
                              : Colors.transparent,
                          height: 50,
                          width: 200,
                          child: Center(
                            child: Text(route.name),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          );
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
