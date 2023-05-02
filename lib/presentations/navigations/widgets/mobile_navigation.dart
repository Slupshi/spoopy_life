import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';

class MobileNavigation extends StatefulWidget {
  final Widget child;
  const MobileNavigation({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _MobileNavigationState();
}

class _MobileNavigationState extends State<MobileNavigation> {
  int get _currentIndex => _locationToIndex(GoRouter.of(context).location);

  int _locationToIndex(String location) {
    final index = routes.indexWhere((t) => location.startsWith(t.path));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int index) {
    if (index != _currentIndex) {
      context.go(routes[index].path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SpoopyLife"),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _onItemTapped(context, index),
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
  }
}
