import 'package:flutter/material.dart';

class LayoutContainer extends StatelessWidget {
  final Widget child;

  const LayoutContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 107, 15, 168)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(child: child));
  }
}
