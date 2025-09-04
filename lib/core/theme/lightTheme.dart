import 'package:flutter/material.dart';

/// Enhanced Light Theme with Custom Fonts
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Roboto',

  // Color Scheme
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6366F1), // Indigo
    primaryContainer: Color(0xFFEEF2FF),
    secondary: Color(0xFF10B981), // Emerald
    secondaryContainer: Color(0xFFD1FAE5),
    surface: Color(0xFFFFFFFF),
    surfaceContainerHighest: Color(0xFFF9FAFB),
    surfaceContainer: Colors.grey,
    error: Color(0xFFEF4444),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF111827),
    surfaceContainerHigh: Color(0xFF1F2937),
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFFD1D5DB),
  ),

  scaffoldBackgroundColor: const Color(0xFFFCFCFD),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor:   Color(0xFFFCFCFD),
    foregroundColor: Color(0xFF111827),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xFF111827),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),

  // Bottom Navigation Bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    selectedItemColor: Color(0xFF6366F1),
    unselectedItemColor: Color(0xFF6B7280),
    selectedLabelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),



  // Button Themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: const Color(0xFFFFFFFF),
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // Text Theme with Custom Font
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      fontSize: 32,
      color: Color(0xFF111827),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xFF111827),
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: Color(0xFF111827),
    ),
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: Color(0xFF111827),
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Color(0xFF374151),
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFF4B5563),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xFF374151),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xFF4B5563),
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xFF6B7280),
    ),
  ),
  searchBarTheme: SearchBarThemeData(
    hintStyle:WidgetStatePropertyAll(TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color:Color(0xFFFFFFFF).withValues(alpha: 0.4),
    )) ,
    textStyle:WidgetStatePropertyAll(TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color:Color(0xFFFFFFFF),
    )) ,
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12)),
    elevation: WidgetStatePropertyAll(0),
    backgroundColor: WidgetStateProperty.resolveWith((state){
      if (state.contains(WidgetState.focused)){
        return  Color(0xFF111827);
      }else{
        return Color(0xFF111827);
      }
    }),
  )
);