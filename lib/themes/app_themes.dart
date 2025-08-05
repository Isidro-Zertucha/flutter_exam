import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue[800],
    colorScheme: ColorScheme.light(
      primary: Colors.blue[800]!,
      secondary: Colors.blueAccent,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[800],
      elevation: 4.0,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ).titleLarge,
    ),
    cardTheme: CardThemeData(
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.teal[400]!,
    colorScheme: ColorScheme.dark(
      primary: Colors.teal[400]!,
      secondary: Colors.blueGrey[900]!,
      surface: Colors.blueGrey[900]!,
    ),
    scaffoldBackgroundColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal[600]!,
      elevation: 4.0,
    ),
    cardTheme: CardThemeData(
      elevation: 8.0,
      color: Colors.blueGrey[700]!.withAlpha(200),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.blueGrey[700],
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
      bodyLarge: TextStyle(fontSize: 16.0),
    ),
  );
}
