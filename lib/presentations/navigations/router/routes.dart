import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spoopy_life/presentations/home/views/desktop/home_view.dart';
import 'package:spoopy_life/presentations/home/views/mobile/home_view.dart';
import 'package:spoopy_life/presentations/sleep/desktop/sleep_view.dart';
import 'package:spoopy_life/presentations/sleep/mobile/sleep_view.dart';

class MyRoute {
  final String name;
  final String path;

  final IconData icon;
  final double iconSize;

  final Widget child;

  const MyRoute({
    required this.name,
    required this.path,
    required this.icon,
    this.iconSize = 20,
    required this.child,
  });
}

final List<MyRoute> routes = [
  MyRoute(
    name: "Home",
    path: "/home",
    icon: Icons.home,
    child: _child(
      mobileChild: const HomeViewMobile(),
      desktopChild: const HomeViewDesktop(),
    ),
  ),
  MyRoute(
    name: "Sleep",
    path: "/sleep",
    icon: Icons.nightlight_round,
    child: _child(
      mobileChild: const SleepViewMobile(),
      desktopChild: const SleepViewDesktop(),
    ),
  ),
];

Widget _child({
  required Widget mobileChild,
  required Widget desktopChild,
}) {
  if (Platform.isAndroid || Platform.isIOS) {
    return mobileChild;
  } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    return Expanded(child: desktopChild);
  } else {
    return const Expanded(
      child: Center(
        child: Text("Not Implemented"),
      ),
    );
  }
}
