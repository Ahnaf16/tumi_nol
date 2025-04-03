import 'package:flutter/widgets.dart';
import 'package:tumi_nol/main.dart';
import 'package:tumi_nol/main.export.dart';

class Toast {
  static final _context = navKey.currentContext!;

  static void show(String message, [String? title]) {
    ShadToaster.of(_context).show(ShadToast(description: Text(message)));
  }

  static void showErr(String message, [String? title]) {
    ShadToaster.of(_context).show(_buildToast(message, title: title, isDistractive: true));
  }

  static ShadToast _buildToast(String message, {String? title, bool isDistractive = false}) {
    return ShadToast(
      padding: Pads.padding(h: Insets.lg, v: Insets.med),
      border: isDistractive ? Border.all(color: _context.colors.destructive) : null,
      backgroundColor: isDistractive ? _context.colors.destructive.op1 : null,
      title: title == null ? null : Text(title),
      description: Text(message),
      descriptionStyle: _context.text.muted,
    );
  }
}
