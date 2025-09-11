import 'package:flutter/material.dart';

/// Enhanced Light Theme with Blue & Light Color Scheme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Roboto',

  // Enhanced Blue & Light Color Scheme
  colorScheme: const ColorScheme.light(
    // Primary Blues - Vibrant for light mode
    primary: Color(0xFF2563EB), // Blue-600
    primaryContainer: Color(0xFFBFDBFE), // Blue-100
    onPrimary: Color(0xFFFFFFFF), // White text on blue
    onPrimaryContainer: Color(0xFF1E3A8A), // Blue-800

    // Secondary Blues - Sky variants
    secondary: Color(0xFF0284C7), // Sky-600
    secondaryContainer: Color(0xFFB2EBF2), // Sky-100
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF01579B), // Sky-800

    // Tertiary - Soft blue
    tertiary: Color(0xFF3B82F6), // Blue-500
    tertiaryContainer: Color(0xFFDBEAFE), // Blue-100
    onTertiary: Color(0xFFFFFFFF),
    onTertiaryContainer: Color(0xFF1E40AF), // Blue-800

    // Light Surfaces with subtle blue tints
    surface: Color(0xFFF8FAFC), // Slate-50
    surfaceContainer: Color(0xFFE2E8F0), // Slate-100
    surfaceContainerHigh: Color(0xFFCBD5E1), // Slate-200
    surfaceContainerHighest: Color(0xFFB4BCC8), // Slate-300
    surfaceContainerLow: Color(0xFFF1F5F9), // Slate-25
    surfaceContainerLowest: Color(0xFFFFFFFF), // Pure white
    onSurface: Color(0xFF0F172A), // Slate-900
    onSurfaceVariant: Color(0xFF475569), // Slate-600

    // Error colors for light mode
    error: Color(0xFFEF4444), // Red-500
    errorContainer: Color(0xFFFFB4AB), // Red-200
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFFB91C1C), // Red-800

    // Outline and borders - subtle in light mode
    outline: Color(0xFF94A3B8), // Slate-400
    outlineVariant: Color(0xFFCBD5E1), // Slate-200

    // Inverse colors
    inverseSurface: Color(0xFF0F172A), // Slate-900
    onInverseSurface: Color(0xFFF8FAFC), // Slate-50
    inversePrimary: Color(0xFF93C5FD), // Blue-300
  ),

  // Light scaffold with subtle blue tint
  scaffoldBackgroundColor: const Color(0xFFF1F5F9), // Slate-25

  // Light AppBar with blue accents
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF8FAFC),
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

  // Light Bottom Navigation with blue accents
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF8FAFC),
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

  // Light button themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2563EB),
      foregroundColor: const Color(0xFFFFFFFF),
      shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.3),
      elevation: 3,
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

  // Enhanced Light Text Theme
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
      letterSpacing: -0.1,
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
      color: Color(0xFF475569),
      letterSpacing: 0.1,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xFF64748B),
      letterSpacing: 0.1,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xFF475569),
      letterSpacing: 0.1,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xFF64748B),
      letterSpacing: 0.1,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xFF94A3B8),
      letterSpacing: 0.2,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xFF475569),
      letterSpacing: 0.2,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Color(0xFF64748B),
      letterSpacing: 0.3,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Color(0xFF94A3B8),
      letterSpacing: 0.4,
    ),
  ),

  // Light Search Bar with blue accents
  searchBarTheme: SearchBarThemeData(
    // Hint text styling - placeholder text for light theme
    hintStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFF94A3B8), // Slate-400 - visible on light background
          letterSpacing: 0.1,
        );
      }
      return const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFFCBD5E1), // Lighter gray hint
        letterSpacing: 0.1,
      );
    }),

    // Input text styling - actual typed text for light theme
    textStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xFF0F172A), // Dark text on light background
          letterSpacing: 0.1,
        );
      }
      return const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color(0xFF1E293B), // Slightly lighter text
        letterSpacing: 0.1,
      );
    }),

    // Enhanced padding for better touch target
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),

    // Subtle elevation for depth in light mode
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return 4.0; // Slightly lower elevation for light mode
      }
      if (states.contains(WidgetState.hovered)) {
        return 2.0; // Noticeable elevation on hover
      }
      return 1.0; // Default elevation for light surfaces
    }),

    // Light theme background colors with blue accents
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFFF1F5F9); // Light slate when focused
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFFDBEAFE); // Light blue on hover
      }
      if (states.contains(WidgetState.disabled)) {
        return const Color(0xFFE2E8F0); // Light gray when disabled
      }
      return const Color(0xFFFFFFFF); // Pure white default
    }),

    // Enhanced border for light theme visibility
    side: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const BorderSide(
          color: Color(0xFF2563EB), // Bright blue border when focused
          width: 2,
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return const BorderSide(
          color: Color(0xFF3B82F6), // Medium blue on hover
          width: 1.5,
        );
      }
      if (states.contains(WidgetState.error)) {
        return const BorderSide(
          color: Color(0xFFEF4444), // Red for errors in light mode
          width: 2,
        );
      }
      return const BorderSide(
        color: Color(0xFFCBD5E1), // Subtle gray for outline
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

    // Light theme shadow colors for depth
    shadowColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFF2563EB).withValues(alpha: 0.2); // Blue glow when focused
      }
      return const Color(0xFF000000).withValues(alpha: 0.1); // Subtle shadow for light mode
    }),

    // Surface tint for Material 3 light design
    surfaceTintColor: const WidgetStatePropertyAll(Color(0xFF2563EB)),

    // Overlay color for press states in light mode
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return const Color(0xFF2563EB).withValues(alpha: 0.1); // Light overlay for light mode
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFF3B82F6).withValues(alpha: 0.05);
      }
      return Colors.transparent;
    }),
  ),

  // Light Card Theme
  cardTheme: CardThemeData(
    color: const Color(0xFFFFFFFF),
    surfaceTintColor: const Color(0xFF2563EB),
    elevation: 2,
    shadowColor: const Color(0xFF000000).withValues(alpha: 0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.all(8),
  ),

  // Light Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: const Color(0xFFE2E8F0),
    selectedColor: const Color(0xFF2563EB),
    disabledColor: const Color(0xFFF1F5F9),
    labelStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFF0F172A),
    ),
    side: const BorderSide(color: Color(0xFFCBD5E1)),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),

  // Light Input Decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF1F5F9),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFEF4444)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    hintStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: Color(0xFF94A3B8),
    ),
  ),

  // Light Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2563EB),
    foregroundColor: Color(0xFFFFFFFF),
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
);