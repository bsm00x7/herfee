import 'package:flutter/material.dart';


final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  // Color Scheme
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF6366F1), // Indigo
    primaryContainer: Color(0xFF4F46E5),
    secondary: Color(0xFF10B981), // Emerald
    secondaryContainer: Color(0xFF059669),
    surface: Color(0xFF1F2937), // Gray-800
    surfaceContainerHighest: Color(0xFF374151), // Gray-700
    surfaceContainer: Color(0xFF111827), // Gray-900
    error: Color(0xFFEF4444),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFFF9FAFB),
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFF6B7280),
  ),

  // Scaffold
  scaffoldBackgroundColor: const Color(0xFF111827),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F2937),
    foregroundColor: Color(0xFFF9FAFB),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(0xFFF9FAFB),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // Bottom Navigation Bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(

    backgroundColor: Color(0xFF1F2937),
    selectedItemColor: Color(0xFF6366F1),
    unselectedItemColor: Color(0xFF9CA3AF),
    selectedIconTheme: IconThemeData(
      color: Color(0xFF6366F1),
      size: 24,
    ),
    unselectedIconTheme: IconThemeData(
      color: Color(0xFF9CA3AF),
      size: 24,
    ),
    selectedLabelStyle: TextStyle(
      color: Color(0xFF6366F1),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: TextStyle(
      color: Color(0xFF9CA3AF),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  // Card Theme
  cardTheme: const CardThemeData(
    color: Color(0xFF1F2937),
    shadowColor: Color(0x1A000000),
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

  // Text Theme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Color(0xFFF9FAFB), fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: Color(0xFFF9FAFB), fontWeight: FontWeight.w600),
    titleLarge: TextStyle(color: Color(0xFFF9FAFB), fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(color: Color(0xFFF3F4F6)),
    bodyMedium: TextStyle(color: Color(0xFFE5E7EB)),
    bodySmall: TextStyle(color: Color(0xFFD1D5DB)),
  ),

  // Input Decoration Theme
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF374151),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFF6B7280)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFF6B7280)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFF6366F1), width: 2),
    ),
  ),
);