import 'package:flutter/material.dart';
import 'package:tumi_nol/_styled_widgets/deco_container.dart';
import 'package:tumi_nol/main.export.dart';

class CountSeparator extends StatelessWidget {
  const CountSeparator({super.key, required this.title, required this.count});

  final String title;
  final num count;

  @override
  Widget build(BuildContext context) {
    return ShadBadge.outline(
      child: Text.rich(
        TextSpan(
          style: context.text.muted.size(10),
          children: [
            TextSpan(text: '$title '),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: DecoContainer(width: 4, height: 4, borderRadius: Corners.circle, color: context.colors.border),
            ),
            TextSpan(text: ' ${NumberFormat.compact().format(count)}'),
          ],
        ),
      ),
    );
  }
}
