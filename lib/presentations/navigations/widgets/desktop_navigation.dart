import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';

class DesktopNavigation extends StatefulWidget {
  final Widget child;
  const DesktopNavigation({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _DesktopNavigationState();
}

class _DesktopNavigationState extends State<DesktopNavigation> {
  int get _currentIndex => _locationToIndex(GoRouter.of(context).location);

  int _locationToIndex(String location) {
    final index = routes.indexWhere((t) => location.startsWith(t.path));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  bool _isSelected(MyRoute route) => _currentIndex == routes.indexOf(route);

  @override
  Widget build(BuildContext context) {
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
                  GestureDetector(
                    onTap: () => context.go(route.path),
                    child: Container(
                      color:
                          _isSelected(route) ? Colors.red : Colors.transparent,
                      height: 50,
                      width: 200,
                      child: Center(
                        child: Text(
                          route.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: _isSelected(route)
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
