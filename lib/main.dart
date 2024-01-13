import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:e_learning/page/splash.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 185, 0, 252),

  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const SplashPage(),
    );
  }
}
