import 'package:e_learning/page/home.dart';
import 'package:e_learning/page/profile.dart';
import 'package:e_learning/page/intro.dart';
import 'package:e_learning/page/score.dart';
import 'package:e_learning/page/signup.dart';
import 'package:e_learning/page/tour_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_learning/page/splash.dart';
import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:showcaseview/showcaseview.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 156, 27, 255),
  ),
  textTheme: GoogleFonts.ptSansTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.init();
  await dotenv.load();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: SplashPage(),
    );
  }
}
