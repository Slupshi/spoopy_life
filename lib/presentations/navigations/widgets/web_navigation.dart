import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';

class WebNavigation extends StatefulWidget {
  final Widget child;
  const WebNavigation({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _WebNavigationState();
}

class _WebNavigationState extends State<WebNavigation> {
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
        leadingWidth: 200,
        leading: const Center(
          child: Text(
            "SpoopyLife",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
              onPressed: () {
                debugPrint("UserIcon clicked"); // TODO: Remove this
              },
              icon: const Icon(
                Icons.person,
                size: 25,
              ),
            ),
          ),
        ],
        title: Row(
          children: [
            for (var route in routes) ...[
              InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () => context.go(route.path),
                child: Container(
                  height: 50,
                  width: 200,
                  color: _isSelected(route) ? Colors.red : Colors.transparent,
                  child: Center(child: Text(route.name)),
                ),
              ),
            ],
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
