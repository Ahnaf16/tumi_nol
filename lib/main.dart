import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tumi_nol/features/home/view/home_view.dart';
import 'package:tumi_nol/main.export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadRoseColorScheme.dark(),
        textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.jetBrainsMono),
      ),
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadRoseColorScheme.light(),
        textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.jetBrainsMono),
      ),
      builder: (context, child) => Layouts.init(context, child),
      home: const HomeView(),
    );
  }
}
