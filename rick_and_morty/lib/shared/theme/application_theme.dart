import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/app_theme.dart';
import 'data/app_theme_model.dart';

class ApplicationTheme {
  static AppThemeModel? byName(String themeName) {
    try {
      return themes[AppTheme.values.byName(themeName)];
    } catch (_) {
      return themes.entries.first.value;
    }
  }

  static final themes = {
    AppTheme.light: AppThemeModel(
      theme: AppTheme.light,
      themeData: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        cardTheme: const CardTheme(elevation: 4.0),
      ),
      icon: const Icon(Icons.light_mode),
    ),
    AppTheme.dark: AppThemeModel(
      theme: AppTheme.dark,
      themeData: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      icon: const Icon(Icons.dark_mode),
    ),
    AppTheme.halloween: AppThemeModel(
      theme: AppTheme.halloween,
      themeData: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.orange[100],
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      ),
      icon: const Icon(Icons.forest),
    ),
    AppTheme.piano: AppThemeModel(
      theme: AppTheme.piano,
      themeData: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.aclonicaTextTheme(),
        cardTheme: const CardTheme(
          elevation: 1.0,
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF000000,
            <int, Color>{
              50: Color(0xFF000000),
              100: Color(0xFF000000),
              200: Color(0xFF000000),
              300: Color(0xFF000000),
              400: Color(0xFF000000),
              500: Color(0xFF000000),
              600: Color(0xFF000000),
              700: Color(0xFF000000),
              800: Color(0xFF000000),
              900: Color(0xFF000000),
            },
          ),
        ),
      ),
      icon: const Icon(Icons.piano),
    ),
  };
}
