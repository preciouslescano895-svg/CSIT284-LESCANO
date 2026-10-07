import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

// Custom colors
const kRosewood = Color.fromARGB(255, 160, 137, 129);
const kLightTaupe = Color.fromARGB(255, 208, 200, 189);

var kColorScheme = ColorScheme.fromSeed(
  seedColor: kRosewood,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: kRosewood,
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,

        appBarTheme: const AppBarThemeData(
          backgroundColor: kRosewood,
          foregroundColor: Colors.white,
        ),

        cardTheme: const CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kRosewood,
            foregroundColor: Colors.white,
          ),
        ),
      ),

      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,

        scaffoldBackgroundColor: kLightTaupe,

        appBarTheme: const AppBarThemeData(
          backgroundColor: kRosewood,
          foregroundColor: Colors.white,
        ),

        cardTheme: const CardThemeData().copyWith(
          color: const Color.fromARGB(255, 235, 228, 221),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kRosewood,
            foregroundColor: Colors.white,
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 85, 67, 61),
                fontSize: 16,
              ),
            ),
      ),

      themeMode: ThemeMode.system,

      home: const Expenses(),
    ),
  );
}