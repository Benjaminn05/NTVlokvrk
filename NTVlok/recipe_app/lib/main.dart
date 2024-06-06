import 'package:flutter/material.dart';

import 'package:flutterapp/screens/catagories.dart';

import 'package:google_fonts/google_fonts.dart';


// Defining the theme for the app
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 0, 80, 150),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

// Main entry point of the application
void main() {
  runApp(const App());
}

// Main App widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesScreen()
);
  }
} 



