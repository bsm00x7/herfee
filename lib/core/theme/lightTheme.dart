import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  // Color Scheme
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6366F1), // Indigo
    primaryContainer: Color(0xFFEEF2FF),
    secondary: Color(0xFF10B981), // Emerald
    secondaryContainer: Color(0xFFD1FAE5),
    surface: Color(0xFFFFFFFF),
    surfaceContainerHighest: Color(0xFFF9FAFB),
    surfaceContainer: Color(0xFFFCFCFD),
    error: Color(0xFFEF4444),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF111827),
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFFD1D5DB),
  ),

  // Scaffold
  scaffoldBackgroundColor: const Color(0xFFFCFCFD),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
    foregroundColor: Color(0xFF111827),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(0xFF111827),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    shadowColor: Color(0x0D000000),
  ),

  // Bottom Navigation Bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    selectedItemColor: Color(0xFF6366F1),
    unselectedItemColor: Color(0xFF6B7280),
    selectedIconTheme: IconThemeData(
      color: Color(0xFF6366F1),
      size: 24,
    ),
    unselectedIconTheme: IconThemeData(
      color: Color(0xFF6B7280),
      size: 24,
    ),
    selectedLabelStyle: TextStyle(
      color: Color(0xFF6366F1),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: TextStyle(
      color: Color(0xFF6B7280),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  // Card Theme
  cardTheme: const CardThemeData(
    color: Color(0xFFFFFFFF),
    shadowColor: Color(0x0D000000),
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: const Color(0xFFFFFFFF),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),

  // Text Button Theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF6366F1),
    ),
  ),

  // Text Theme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Color(0xFF111827), fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: Color(0xFF111827), fontWeight: FontWeight.w600),
    titleLarge: TextStyle(color: Color(0xFF111827), fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(color: Color(0xFF374151)),
    bodyMedium: TextStyle(color: Color(0xFF4B5563)),
    bodySmall: TextStyle(color: Color(0xFF6B7280)),
  ),

  // Input Decoration Theme
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF9FAFB),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFFD1D5DB)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFFD1D5DB)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFF6366F1), width: 2),
    ),
  ),

  // Divider Theme
  dividerTheme: const DividerThemeData(
    color: Color(0xFFE5E7EB),
    thickness: 1,
  ),
);