import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Swipe extends StatelessWidget {
  final Widget child;

  final Function()? onTap;

  final Function()? onSwipeUp;

  final Function()? onSwipeDown;

  final Function()? onSwipeLeft;

  final Function()? onSwipeRight;

  /// Default: 50
  final double verticalMaxWidthThreshold;

  /// minimum displacement of pointer on the vertical axis
  /// to be counted as a swipe
  ///
  /// Default: 100
  final double verticalMinDisplacement;

  /// minimum absolute velocity of pointer moving on the vertical axis
  /// to be counted as a swipe
  ///
  /// Default: 300
  final double verticalMinVelocity;

  /// Default: 50
  final double horizontalMaxHeightThreshold;

  /// minimum displacement of pointer on the horizontal axis
  /// to be counted as a swipe
  ///
  /// Default: 100
  final double horizontalMinDisplacement;

  /// minimum absolute velocity of pointer moving on the horizontal axis
  /// to be counted as a swipe
  ///
  /// Default: 300
  final double horizontalMinVelocity;

  const Swipe({
    super.key,
    required this.child,
    this.onTap,
    this.onSwipeUp,
    this.onSwipeDown,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.verticalMaxWidthThreshold = 50,
    this.verticalMinDisplacement = 100,
    this.verticalMinVelocity = 300,
    this.horizontalMaxHeightThreshold = 50,
    this.horizontalMinDisplacement = 100,
    this.horizontalMinVelocity = 300,
  });

  @override
  Widget build(BuildContext context) {
    DragStartDetails? startVerticalDragDetails;
    DragUpdateDetails? updateVerticalDragDetails;

    DragStartDetails? startHorizontalDragDetails;
    DragUpdateDetails? updateHorizontalDragDetails;

    return GestureDetector(
      onTap: onTap,
      onVerticalDragStart: (dragDetails) => startVerticalDragDetails = dragDetails,
      onVerticalDragUpdate: (dragDetails) => updateVerticalDragDetails = dragDetails,
      onVerticalDragEnd: (endDetails) {
        if (startVerticalDragDetails != null && updateVerticalDragDetails != null) {
          final double dx =
              (updateVerticalDragDetails!.globalPosition.dx - startVerticalDragDetails!.globalPosition.dx).abs();
          final double dy =
              (updateVerticalDragDetails!.globalPosition.dy - startVerticalDragDetails!.globalPosition.dy).abs();
          final double velocity = endDetails.primaryVelocity ?? 0.0;

          if (dx > verticalMaxWidthThreshold) return;
          if (dy < verticalMinDisplacement) return;
          if (velocity.abs() < verticalMinVelocity) return;

          if (velocity < 0) onSwipeUp?.call();
          if (velocity > 0) onSwipeDown?.call();
        }
      },
      onHorizontalDragStart: (dragDetails) => startHorizontalDragDetails = dragDetails,
      onHorizontalDragUpdate: (dragDetails) => updateHorizontalDragDetails = dragDetails,
      onHorizontalDragEnd: (endDetails) {
        if (startHorizontalDragDetails != null && updateHorizontalDragDetails != null) {
          final double dx =
              (updateHorizontalDragDetails!.globalPosition.dx - startHorizontalDragDetails!.globalPosition.dx).abs();
          final double dy =
              (updateHorizontalDragDetails!.globalPosition.dy - startHorizontalDragDetails!.globalPosition.dy).abs();
          final double velocity = endDetails.primaryVelocity ?? 0.0;

          if (dy > horizontalMaxHeightThreshold) return;
          if (dx < horizontalMinDisplacement) return;
          if (velocity.abs() < horizontalMinVelocity) return;

          if (velocity < 0) onSwipeLeft?.call();
          if (velocity > 0) onSwipeRight?.call();
        }
      },
      child: child,
    );
  }
}
