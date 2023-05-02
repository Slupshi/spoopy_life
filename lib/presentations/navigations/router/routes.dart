import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spoopy_life/presentations/home/views/desktop/home_view.dart';
import 'package:spoopy_life/presentations/home/views/mobile/home_view.dart';

class Route {
  final String name;
  final String path;

  final IconData icon;
  final double iconSize;

  final Widget child;

  const Route({
    required this.name,
    required this.path,
    required this.icon,
    this.iconSize = 20,
    required this.child,
  });
}

final List<Route> routes = [
  Route(
    name: "Home",
    path: "/home",
    icon: Icons.home,
    child: _child(
      mobileChild: const HomeViewMobile(),
      desktopChild: const HomeViewDesktop(),
    ),
  ),
];

Widget _child({
  required Widget mobileChild,
  required Widget desktopChild,
}) {
  if (Platform.isAndroid || Platform.isIOS) {
    return Expanded(child: mobileChild);
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
