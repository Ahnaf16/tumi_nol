import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tumi_nol/features/home/Playlist/view/playlist_view.dart';
import 'package:tumi_nol/features/home/view/home_view.dart';
import 'package:tumi_nol/main.export.dart';

final navKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      navigatorKey: navKey,
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
      home: const NavRoot(),
    );
  }
}

class NavRoot extends HookWidget {
  const NavRoot({super.key});

  final pages = const [HomeView(), PlaylistView()];

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    return Scaffold(
      body: pages[index.value],
      bottomNavigationBar: ShadTabs(
        value: index.value,
        tabBarConstraints: BoxConstraints(maxWidth: context.isTn ? context.width : 400),
        onChanged: (value) => index.value = value,
        tabs: const [ShadTab(value: 0, child: Icon(LuIcons.search)), ShadTab(value: 1, child: Icon(LuIcons.list))],
      ),
    );
  }
}
