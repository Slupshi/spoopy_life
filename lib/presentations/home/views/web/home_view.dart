import 'package:flutter/material.dart';
import 'package:spoopy_life/geolocator.dart';

class HomeViewWeb extends StatelessWidget {
  const HomeViewWeb({super.key});

  @override
  Widget build(BuildContext context) {
    var pos = determinePosition();
    return const Center(
      child: Text("HomeWeb"),
    );
  }
}
