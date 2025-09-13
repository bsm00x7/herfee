import 'package:flutter/material.dart';

/// Enhanced Dark Theme with Blue & Dark Color Scheme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'Roboto',

  // Enhanced Blue & Dark Color Scheme
  colorScheme: const ColorScheme.dark(
    // Primary Blues - Brighter for dark mode
    primary: Color(0xFF3B82F6), // Blue-500
    primaryContainer: Color(0xFF1E3A8A), // Blue-800
    onPrimary: Color(0xFF0F172A), // Dark text on blue
    onPrimaryContainer: Color(0xFF93C5FD), // Blue-300

    // Secondary Blues - Sky variants
    secondary: Color(0xFF0EA5E9), // Sky-500
    secondaryContainer: Color(0xFF0369A1), // Sky-700
    onSecondary: Color(0xFF0F172A),
    onSecondaryContainer: Color(0xFF7DD3FC), // Sky-300

    // Tertiary - Light blue
    tertiary: Color(0xFF60A5FA), // Blue-400
    tertiaryContainer: Color(0xFF1D4ED8), // Blue-700
    onTertiary: Color(0xFF0F172A),
    onTertiaryContainer: Color(0xFFDBEAFE), // Blue-100

    // Dark Surfaces with blue tints
    surface: Color(0xFF0F172A), // Slate-900
    surfaceContainer: Color(0xFF1E293B), // Slate-800
    surfaceContainerHigh: Color(0xFF334155), // Slate-700
    surfaceContainerHighest: Color(0xFF475569), // Slate-600
    surfaceContainerLow: Color(0xFF0C1220), // Darker slate
    surfaceContainerLowest: Color(0xFF030712), // Almost black
    onSurface: Color(0xFFF8FAFC), // Slate-50
    onSurfaceVariant: Color(0xFFCBD5E1), // Slate-300

    // Error colors for dark mode
    error: Color(0xFFF87171), // Red-400
    errorContainer: Color(0xFF7F1D1D), // Red-900
    onError: Color(0xFF0F172A),
    onErrorContainer: Color(0xFFFECACA), // Red-200

    // Outline and borders - more visible in dark
    outline: Color(0xFF475569), // Slate-600
    outlineVariant: Color(0xFF334155), // Slate-700

    // Inverse colors
    inverseSurface: Color(0xFFF8FAFC), // Slate-50
    onInverseSurface: Color(0xFF0F172A), // Slate-900
    inversePrimary: Color(0xFF1D4ED8), // Blue-700
  ),

  // Dark scaffold with blue tint
  scaffoldBackgroundColor: const Color(0xFF020617), // Slate-950

  // Dark AppBar with blue accents
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0F172A),
    surfaceTintColor: Color(0xFF3B82F6),
    foregroundColor: Color(0xFFF8FAFC),
    elevation: 0,
    scrolledUnderElevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xFFF8FAFC),
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF60A5FA),
      size: 24,
    ),
  ),

  // Dark Bottom Navigation with blue accents
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF0F172A),
    selectedItemColor: Color(0xFF60A5FA), // Blue-400
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

  // Dark button themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF3B82F6),
      foregroundColor: const Color(0xFFFFFFFF),
      shadowColor: const Color(0xFF3B82F6).withValues(alpha: 0.4),
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
      foregroundColor: const Color(0xFF60A5FA),
      side: const BorderSide(color: Color(0xFF60A5FA), width: 1.5),
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
      foregroundColor: const Color(0xFF60A5FA),
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 0.1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // Enhanced Dark Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      fontSize: 36,
      color: Color(0xFFF8FAFC),
      letterSpacing: -1.0,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 32,
      color: Color(0xFFF8FAFC),
      letterSpacing: -0.8,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xFFF8FAFC),
      letterSpacing: -0.6,
      height: 1.3,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: Color(0xFFF8FAFC),
      letterSpacing: -0.4,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: Color(0xFFF8FAFC),
      letterSpacing: -0.2,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Color(0xFFE2E8F0),
      letterSpacing: -0.1,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Color(0xFFE2E8F0),
      letterSpacing: 0,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Color(0xFFCBD5E1),
      letterSpacing: 0.1,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xFFB4BCC8),
      letterSpacing: 0.1,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xFFCBD5E1),
      letterSpacing: 0.1,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xFFB4BCC8),
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
      color: Color(0xFFCBD5E1),
      letterSpacing: 0.2,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Color(0xFFB4BCC8),
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

  // Dark Search Bar with blue accents
  searchBarTheme: SearchBarThemeData(
    // Dark mode hint text with modern contrast ratios
    hintStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Color(0xFF9CA3AF), // Neutral-400 for good dark mode contrast
          letterSpacing: -0.01,
          height: 1.4,
        );
      }
      return const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: Color(0xFF6B7280), // Darker neutral-500 for subtle hint
        letterSpacing: -0.01,
        height: 1.4,
      );
    }),

    // High contrast input text for dark mode readability
    textStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Color(0xFFF9FAFB), // Near-white for maximum contrast
          letterSpacing: -0.01,
          height: 1.4,
        );
      }
      return const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Color(0xFFE5E7EB), // Neutral-200 for readable text
        letterSpacing: -0.01,
        height: 1.4,
      );
    }),

    // Consistent modern padding
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),

    // Enhanced elevation for dark mode depth perception
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return 12.0; // Higher elevation in dark mode for better definition
      }
      if (states.contains(WidgetState.hovered)) {
        return 6.0;
      }
      return 2.0; // Slight default elevation for dark surfaces
    }),

    // Dark mode backgrounds with modern carbon aesthetics
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFF1F2937); // Neutral-800 for focused state
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFF374151); // Neutral-700 on hover
      }
      if (states.contains(WidgetState.disabled)) {
        return const Color(0xFF111827); // Very dark neutral-900
      }
      return const Color(0xFF0F172A); // Rich dark slate-900 default
    }),

    // Vibrant borders that glow in dark mode
    side: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const BorderSide(
          color: Color(0xFF8B5CF6), // Bright purple-500 for dark mode
          width: 2.0,
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return const BorderSide(
          color: Color(0xFF06B6D4), // Cyan-500 accent
          width: 1.5,
        );
      }
      if (states.contains(WidgetState.error)) {
        return const BorderSide(
          color: Color(0xFFF97316), // Warm orange-500 for dark mode errors
          width: 2.0,
        );
      }
      return const BorderSide(
        color: Color(0xFF4B5563), // Neutral-600 for subtle dark outline
        width: 1.0,
      );
    }),

    // Consistent modern radius system
    shape: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        );
      }
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      );
    }),

    // Dark mode shadows with neon glow effects
    shadowColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return const Color(0xFF8B5CF6).withOpacity(0.4); // Purple glow
      }
      return const Color(0xFF000000).withOpacity(0.3); // Deeper shadows for dark mode
    }),

    // Modern surface tint with gradient influence
    surfaceTintColor: const WidgetStatePropertyAll(Color(0xFF06B6D4)),

    // Dark mode interaction overlays
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return const Color(0xFF8B5CF6).withOpacity(0.15);
      }
      if (states.contains(WidgetState.hovered)) {
        return const Color(0xFF06B6D4).withOpacity(0.08);
      }
      return Colors.transparent;
    }),

    // Consistent constraints
    constraints: const BoxConstraints(
      minHeight: 52,
      maxHeight: 52,
    ),
  ),

  // Dark Card Theme
  cardTheme: CardThemeData(
    color: const Color(0xFF1E293B),
    surfaceTintColor: const Color(0xFF3B82F6),
    elevation: 2,
    shadowColor: const Color(0xFF000000).withValues(alpha: 0.3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.all(8),
  ),

  // Dark Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: const Color(0xFF334155),
    selectedColor: const Color(0xFF3B82F6),
    disabledColor: const Color(0xFF1E293B),
    labelStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFFCBD5E1),
    ),
    side: const BorderSide(color: Color(0xFF475569)),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),

  // Dark Input Decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E293B),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF475569)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF475569)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFF87171)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    hintStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: Color(0xFF64748B),
    ),
  ),

  // Dark Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF3B82F6),
    foregroundColor: Color(0xFFFFFFFF),
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
);