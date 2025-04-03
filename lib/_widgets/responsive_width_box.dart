import 'package:flutter/material.dart';

class ResponsiveWidthBox extends StatelessWidget {
  const ResponsiveWidthBox({super.key, required this.child, required this.maxWidth, this.padding});

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final width = screenWidth > maxWidth ? maxWidth : screenWidth;

        return Center(child: Container(width: width, padding: padding, child: child));
      },
    );
  }
}
