import 'package:flutter/material.dart';
import 'package:tumi_nol/main.export.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.size = 20, this.color, this.strokeWidth, this.value});

  final double size;
  final double? strokeWidth;
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        color: color ?? context.colors.foreground,
        strokeWidth: strokeWidth ?? 2,
        value: value,
      ),
    );
  }
}
