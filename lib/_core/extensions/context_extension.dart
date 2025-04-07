import 'package:flutter/material.dart';
import 'package:tumi_nol/main.export.dart';

extension RouteEx on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  Future<T?> push<T extends Object?>(Widget page, {bool? fullScreen}) {
    final route = MaterialPageRoute<T>(builder: (c) => page, fullscreenDialog: fullScreen ?? false);

    return Navigator.of(this).push<T>(route);
  }

  Future<T?> nPushReplace<T extends Object?>(Widget page) {
    final route = MaterialPageRoute<T>(builder: (c) => page);
    return Navigator.of(this).pushReplacement(route);
  }
}

extension ContextEx on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  Size get size => MediaQuery.sizeOf(this);
  double get height => size.height;
  double get width => size.width;

  ShadThemeData get theme => ShadTheme.of(this);

  ShadTextTheme get text => theme.textTheme;
  ShadColorScheme get colors => theme.colorScheme;

  Brightness get bright => theme.brightness;

  bool get isDark => bright == Brightness.dark;
  bool get isLight => bright == Brightness.light;

  Layouts get layout => Layouts.of(this);

  bool get isTn => breakpoint == theme.breakpoints.tn;
  bool get isSm => breakpoint == theme.breakpoints.sm;
  bool get isMd => breakpoint == theme.breakpoints.md;
  bool get isLg => breakpoint == theme.breakpoints.lg;
  bool get isXl => breakpoint == theme.breakpoints.xl;

  ShadDecoration get decoBorder =>
      ShadDecoration(border: ShadBorder.all(color: colors.border, width: 1, radius: theme.radius));
}
