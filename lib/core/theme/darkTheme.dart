import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'Roboto',

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
    surfaceContainerHigh: Color(0xFFF3F4F6),
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFF6B7280),
  ),

  scaffoldBackgroundColor: const Color(0xFF111827),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F2937),
    foregroundColor: Color(0xFFF9FAFB),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xFFF9FAFB),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),

  // Bottom Navigation Bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1F2937),
    selectedItemColor: Color(0xFF6366F1),
    unselectedItemColor: Color(0xFF9CA3AF),
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
      color: Color(0xFFF9FAFB),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xFFF9FAFB),
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: Color(0xFFF9FAFB),
    ),
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: Color(0xFFF9FAFB),
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xFFF3F4F6),
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFFE5E7EB),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xFFF3F4F6),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xFFE5E7EB),
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xFFD1D5DB),
    ),
  ),
    searchBarTheme: SearchBarThemeData(
      hintStyle:WidgetStatePropertyAll(TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color:Colors.grey.withValues(alpha: 0.4),
      )) ,
      textStyle:WidgetStatePropertyAll(TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color:Colors.black,
      )) ,
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12)),
      elevation: WidgetStatePropertyAll(0),
      backgroundColor: WidgetStateProperty.resolveWith((state){
        if (state.contains(WidgetState.focused)){
          return  Color(0xFFF3F4F6);
        }else{
          return Color(0xFFF3F4F6);
        }
      }),
    )
);
