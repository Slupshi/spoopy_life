import 'package:flutter/material.dart';
import 'package:spoopy_life/presentations/navigations/router/routes.dart';
import 'package:spoopy_life/presentations/navigations/widgets/base_navigation.dart';

class MobileNavigation extends StatefulWidget {
  final Widget child;
  const MobileNavigation({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _MobileNavigationState();
}

class _MobileNavigationState extends State<MobileNavigation>
    with NavigationBase {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SpoopyLife"),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex(context),
        onTap: (index) => onItemTapped(context, index),
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
