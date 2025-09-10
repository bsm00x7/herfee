import 'package:flutter/material.dart';

/// Enhanced Light Theme with Blue & White Color Scheme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Roboto',

  // Enhanced Blue & White Color Scheme
  colorScheme: const ColorScheme.light(
    // Primary Blues - Main brand color
    primary: Color(0xFF2563EB), // Blue-600
    primaryContainer: Color(0xFFEBF4FF), // Blue-50
    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF1E40AF), // Blue-700

    // Secondary Blues - Accent colors
    secondary: Color(0xFF0EA5E9), // Sky-500
    secondaryContainer: Color(0xFFE0F2FE), // Sky-50
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF0369A1), // Sky-700

    // Tertiary - Complementary blue
    tertiary: Color(0xFF3B82F6), // Blue-500
    tertiaryContainer: Color(0xFFF0F9FF), // Sky-50
    onTertiary: Color(0xFFFFFFFF),
    onTertiaryContainer: Color(0xFF1E3A8A), // Blue-800

    // Surfaces - Clean whites and light blues
    surface: Color(0xFFFFFFFF), // Pure white
    surfaceContainer: Color(0xFFF8FAFC), // Slate-50
    surfaceContainerHigh: Color(0xFFF1F5F9), // Slate-100
    surfaceContainerHighest: Color(0xFFE2E8F0), // Slate-200
    surfaceContainerLow: Color(0xFFFCFCFD), // Almost white
    surfaceContainerLowest: Color(0xFFFFFFFF), // Pure white
    onSurface: Color(0xFF0F172A), // Slate-900
    onSurfaceVariant: Color(0xFF475569), // Slate-600

    // Error colors
    error: Color(0xFFDC2626), // Red-600
    errorContainer: Color(0xFFFEF2F2), // Red-50
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFFB91C1C), // Red-700

    // Outline and borders
    outline: Color(0xFFCBD5E1), // Slate-300
    outlineVariant: Color(0xFFE2E8F0), // Slate-200

    // Inverse colors
    inverseSurface: Color(0xFF1E293B), // Slate-800
    onInverseSurface: Color(0xFFF8FAFC), // Slate-50
    inversePrimary: Color(0xFF93C5FD), // Blue-300
  ),

  // Clean white scaffold
  scaffoldBackgroundColor: const Color(0xFFFAFAFA), // Neutral-50

  // Modern AppBar with subtle blue tint
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
    surfaceTintColor: Color(0xFF2563EB),
    foregroundColor: Color(0xFF0F172A),
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xFF0F172A),
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF2563EB),
      size: 24,
    ),
  ),

  // Enhanced Bottom Navigation with blue accents
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    selectedItemColor: Color(0xFF2563EB), // Blue-600
    unselectedItemColor: Color(0xFF64748B), // Slate-500
    selectedLabelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 12,
      letterSpacing: 0.1,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.1,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  // Modern button themes with blue gradients
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2563EB),
      foregroundColor: const Color(0xFFFFFFFF),
      shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.3),
      elevation: 2,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 0.1,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF2563EB),
      side: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 0.1,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF2563EB),
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 0.1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // Enhanced Text Theme with better hierarchy
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      fontSize: 36,
      color: Color(0xFF0F172A),
      letterSpacing: -1.0,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 32,
      color: Color(0xFF0F172A),
      letterSpacing: -0.8,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xFF0F172A),
      letterSpacing: -0.6,
      height: 1.3,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: Color(0xFF0F172A),
      letterSpacing: -0.4,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: Color(0xFF0F172A),
      letterSpacing: -0.2,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Color(0xFF1E293B),
      letterSpacing: 0.2,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Color(0xFF1E293B),
      letterSpacing: 0,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
      letterSpacing: 0.1,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xFF475569),
      letterSpacing: 0.1,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xFF334155),
      letterSpacing: 0.1,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xFF475569),
      letterSpacing: 0.1,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xFF64748B),
      letterSpacing: 0.2,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xFF334155),
      letterSpacing: 0.2,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Color(0xFF475569),
      letterSpacing: 0.3,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Color(0xFF64748B),
      letterSpacing: 0.4,
    ),
  ),

  // Modern Search Bar with blue accents
  searchBarTheme: SearchBarThemeData(
    // Hint text styling - placeholder text
    hintStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFF64748B), // Slate-500 - more visible when focused
          letterSpacing: 0.1,
        );
      }
      return const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFFFFFFFF), // White hint text on blue background
        letterSpacing: 0.1,
      );
    }),

    // Input text styling - actual typed text
    textStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xFF0F172A), // Dark text on white background
          letterSpacing: 0.1,
        );
      }
      return const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color(0xFFFFFFFF), // White text on blue background
        letterSpacing: 0.1,
      );
    }),

    // Enhanced padding for better touch target
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),

    // Subtle elevation for depth
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return 4.0; // More elevation when focused
      }
      if (states.contains(WidgetState.hovered)) {
        return 2.0; // Slight elevation on hover
      }
      return 1.0; // Default subtle elevation
    }),

    // Smart background color transitions
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFFFFFFFF); // Pure white when focused
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFF3B82F6); // Lighter blue on hover
      }
      if (states.contains(WidgetState.disabled)) {
        return const Color(0xFF94A3B8); // Gray when disabled
      }
      return const Color(0xFF2563EB); // Default blue
    }),

    // Enhanced border with smooth transitions
    side: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const BorderSide(
          color: Color(0xFF2563EB), // Blue border when focused
          width: 2, // Slightly thicker for emphasis
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return const BorderSide(
          color: Color(0xFF3B82F6), // Lighter blue on hover
          width: 1.5,
        );
      }
      if (states.contains(WidgetState.error)) {
        return const BorderSide(
          color: Color(0xFFEF4444), // Red border for errors
          width: 2,
        );
      }
      return const BorderSide(
        color: Color(0xFF1E40AF), // Darker blue for subtle outline
        width: 1,
      );
    }),

    // Smooth rounded corners
    shape: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // More rounded when focused
        );
      }
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Default rounded corners
      );
    }),

    // Optional: Add shadow color for better depth perception
    shadowColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFF2563EB).withValues(alpha: 0.2); // Blue shadow when focused
      }
      return const Color(0xFF000000).withValues(alpha: 0.1); // Subtle black shadow
    }),

    // Optional: Surface tint for Material 3 design
    surfaceTintColor: const WidgetStatePropertyAll(Color(0xFF2563EB)),

    // Optional: Overlay color for press states
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return const Color(0xFF2563EB).withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFF2563EB).withValues(alpha: 0.05);
      }
      return Colors.transparent;
    }),
  ),

  // Card Theme with subtle blue tint
  cardTheme: CardThemeData(
    color: const Color(0xFFFFFFFF),
    surfaceTintColor: const Color(0xFF2563EB),
    elevation: 1,
    shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.all(8),
  ),

  // Chip Theme with blue variants
  chipTheme: ChipThemeData(
    backgroundColor: const Color(0xFFF1F5F9),
    selectedColor: const Color(0xFF2563EB),
    disabledColor: const Color(0xFFE2E8F0),
    labelStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFF334155),
    ),
    side: const BorderSide(color: Color(0xFFE2E8F0)),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),

  // Input Decoration with blue accents
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF8FAFC),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFDC2626)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    hintStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: Color(0xFF64748B),
    ),
  ),

  // Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2563EB),
    foregroundColor: Color(0xFFFFFFFF),
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
);