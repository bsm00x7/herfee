import 'package:flutter/material.dart';

/// Enhanced Light Theme with Blue & Light Color Scheme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Open Sans',

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
      fontFamily: 'Open Sans',
      color: Color(0xFF0F172A),
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(color: Color(0xFF2563EB), size: 24),
  ),

  // Light Bottom Navigation with blue accents
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF8FAFC),
    selectedItemColor: Color(0xFF2563EB), // Blue-600
    unselectedItemColor: Color(0xFF64748B), // Slate-500
    selectedLabelStyle: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w600,
      fontSize: 12,
      letterSpacing: 0.1,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Open Sans',
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
        fontFamily: 'Open Sans',
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
        fontFamily: 'Open Sans',
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
        fontFamily: 'Open Sans',
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
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w300,
      fontSize: 36,
      color: Color(0xFF0F172A),
      letterSpacing: -1.0,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w400,
      fontSize: 32,
      color: Color(0xFF0F172A),
      letterSpacing: -0.8,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xFF0F172A),
      letterSpacing: -0.6,
      height: 1.3,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: Color(0xFF0F172A),
      letterSpacing: -0.4,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: Color(0xFF0F172A),
      letterSpacing: -0.2,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Color(0xFF1E293B),
      letterSpacing: -0.1,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Color(0xFF1E293B),
      letterSpacing: 0,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Color(0xFF475569),
      letterSpacing: 0.1,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xFF64748B),
      letterSpacing: 0.1,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xFF475569),
      letterSpacing: 0.1,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xFF64748B),
      letterSpacing: 0.1,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xFF94A3B8),
      letterSpacing: 0.2,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xFF475569),
      letterSpacing: 0.2,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Color(0xFF64748B),
      letterSpacing: 0.3,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Color(0xFF94A3B8),
      letterSpacing: 0.4,
    ),
  ),

  // Light Search Bar with blue accents
  searchBarTheme: SearchBarThemeData(
    // Modern hint text with dynamic opacity
    hintStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.blueAccent,
          letterSpacing: -0.01,
          height: 1.4,
        );
      }
      return const TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: Color(0xFF2563EB), // Lighter neutral-400
        letterSpacing: -0.01,
        height: 1.4,
      );
    }),

    // Input text with modern typography
    textStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Color(0xFF111827),
          letterSpacing: -0.01,
          height: 1.4,
        );
      }
      return const TextStyle(
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Color(0xFF1F2937), // Neutral-800
        letterSpacing: -0.01,
        height: 1.4,
      );
    }),

    // Generous padding for modern touch targets
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),

    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return 8.0; // More pronounced depth when active
      }
      if (states.contains(WidgetState.hovered)) {
        return 4.0;
      }
      return 0.0; // Flat design by default
    }),

    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFFFFFFFF); // Pure white when focused
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFFF9FAFB); // Subtle warm gray
      }
      if (states.contains(WidgetState.disabled)) {
        return const Color(0xFFF3F4F6); // Modern disabled state
      }
      return Colors.grey.withValues(
        alpha: 0.2,
      ); // Off-white default for softer appearance
    }),

    // Modern border system with vibrant accents
    side: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const BorderSide(
          color: Colors.blueGrey, // Modern indigo-500
          width: 1.5,
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return const BorderSide(
          color: Color(0xFF8B5CF6), // Purple accent
          width: 1.5,
        );
      }
      if (states.contains(WidgetState.error)) {
        return const BorderSide(
          color: Colors.red, // Modern amber warning
          width: 2.0,
        );
      }
      return const BorderSide(
        color: Colors.black45, // Neutral-200 for subtle outline
        width: 1.8,
      );
    }),

    // Modern rounded corners with dynamic sizing
    shape: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // More organic rounded shape
        );
      }
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Modern standard radius
      );
    }),

    // Contemporary shadow colors with colored tints
    shadowColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFF6366F1).withOpacity(0.25); // Colored shadow glow
      }
      return const Color(0xFF000000).withOpacity(0.08); // Softer default shadow
    }),

    // Modern surface tint with gradient influence
    surfaceTintColor: const WidgetStatePropertyAll(Color(0xFF8B5CF6)),

    // Subtle interaction feedback
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return const Color(0xFF6366F1).withOpacity(0.08);
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFF8B5CF6).withOpacity(0.04);
      }
      return Colors.transparent;
    }),

    // Modern constraints for better responsive design
    constraints: const BoxConstraints(
      minHeight: 52, // Modern minimum touch target
      maxHeight: 52,
    ),
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
      fontFamily: 'Open Sans',
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
      fontFamily: 'Open Sans',
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
