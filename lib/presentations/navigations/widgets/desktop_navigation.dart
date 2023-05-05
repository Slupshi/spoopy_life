import 'package:flutter/material.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';
import 'package:spoopy_life/presentations/navigations/widgets/base_navigation.dart';

class DesktopNavigation extends StatefulWidget {
  final Widget child;
  const DesktopNavigation({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _DesktopNavigationState();
}

class _DesktopNavigationState extends State<DesktopNavigation>
    with NavigationBase {
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
                    onTap: () => onItemTapped(context, routes.indexOf(route)),
                    child: Container(
                      color: isCurrentRoute(context, route)
                          ? Colors.red
                          : Colors.transparent,
                      height: 50,
                      width: 200,
                      child: Center(
                        child: Text(
                          route.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: isCurrentRoute(context, route)
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
