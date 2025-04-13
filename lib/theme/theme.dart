import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:tumi_nol/main.export.dart';

ShadThemeData theme(bool light) {
  return ShadThemeData(
    brightness: light ? Brightness.light : Brightness.dark,
    colorScheme: light ? const ShadRoseColorScheme.light() : const ShadRoseColorScheme.dark(),
    textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.jetBrainsMono),
    cardTheme: ShadCardTheme(padding: Pads.med()),
  );
}
