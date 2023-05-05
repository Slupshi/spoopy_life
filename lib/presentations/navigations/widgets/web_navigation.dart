import 'package:flutter/material.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';
import 'package:spoopy_life/presentations/navigations/widgets/base_navigation.dart';

class WebNavigation extends StatefulWidget {
  final Widget child;
  const WebNavigation({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _WebNavigationState();
}

class _WebNavigationState extends State<WebNavigation> with NavigationBase {
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
              onPressed: () {},
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
                onTap: () => onItemTapped(context, routes.indexOf(route)),
                child: Container(
                  height: 50,
                  width: 200,
                  color: isCurrentRoute(context, route)
                      ? Colors.red
                      : Colors.transparent,
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
