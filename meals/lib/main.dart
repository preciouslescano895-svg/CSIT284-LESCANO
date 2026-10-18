import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/screens/about.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/theme/app_colors.dart';

final theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.cream,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.rougeNoir,
  ).copyWith(
    primary: AppColors.rougeNoir,
    onPrimary: AppColors.cream,
    secondary: AppColors.cognac,
    onSecondary: AppColors.cream,
    tertiary: AppColors.blueCoral,
    onTertiary: AppColors.cream,
    surface: AppColors.cream,
    onSurface: AppColors.blueCoral,
    background: AppColors.cream,
    onBackground: AppColors.blueCoral,
  ),
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: AppColors.blueCoral,
    displayColor: AppColors.blueCoral,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.rougeNoir,
    foregroundColor: AppColors.cream,
    centerTitle: true,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.cream,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.blueCoral,
    selectedItemColor: AppColors.cream,
    unselectedItemColor: AppColors.whiteSand,
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.blueCoral,
    contentTextStyle: TextStyle(
      color: AppColors.cream,
    ),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
      routes: {
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}