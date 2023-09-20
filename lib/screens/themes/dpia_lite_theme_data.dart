import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DpiaLiteThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final _lightFocusColor = Colors.black.withOpacity(0.12);
  static final _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
  );
  static ThemeData darkThemeData = themeData(
    darkColorScheme,
    _darkFocusColor,
  );

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.primary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: const Color.fromARGB(0, 254, 254, 254),
      focusColor: const Color(0xFFFEFEFE),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.bodyMedium!.apply(
          color: _darkFillColor,
        ),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFFA800), // primary
    onPrimary: Colors.white,
    secondary: Color(0xFF1570EF), // second
    onSecondary: Color(0xFF595958), // text 2
    tertiary: Color(0xFF23A9E1), // slide button
    onTertiary: Color(0xFF7CC4FF), // variable
    error: Color(0xFFF22525), // error | favorite
    onError: Colors.white,
    background: Color(0xFF030303), // background
    onBackground: Color(0xFF151513), // container
    surface: Color(0xFF222222), // card
    onSurface: Colors.white, // text 1
    surfaceVariant: Color(0xFF202124), // bottom navigation
    onSurfaceVariant: Color(0xFF83878A), // inactive icon
    outline: Color(0xFF363944), // outline 1
    outlineVariant: Color(0xFF1D1C1A), // outline 2
    inverseSurface: Color(0xFF10100F), // search field
    onInverseSurface: Color(0xFFB5B5B5), // hint text
    surfaceTint: Color(0xFF303030), // inactive favorite
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFA800), // primary
    onPrimary: Colors.white,
    secondary: Color(0xFF1570EF), // second
    onSecondary: Color(0xFF595958), // text 2
    tertiary: Color(0xFF23A9E1), // slide button
    onTertiary: Color(0xFF7CC4FF), // variable
    error: Color(0xFFF22525), // error | favorite
    onError: Colors.white,
    background: Color(0xFF030303), // background
    onBackground: Color(0xFF151513), // container
    surface: Color(0xFF222222), // card
    onSurface: Colors.white, // text 1
    surfaceVariant: Color(0xFF202124), // bottom navigation
    onSurfaceVariant: Color(0xFF83878A), // inactive icon
    outline: Color(0xFF363944), // outline 1
    outlineVariant: Color(0xFF1D1C1A), // outline 2
    inverseSurface: Color(0xFF10100F), // search field
    onInverseSurface: Color(0xFFCCCCCC), // hint text
    surfaceTint: Color(0xFF303030), // inactive favorite
  );

  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _semiBold = FontWeight.w500;
  static const _bold = FontWeight.w600;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.ibmPlexSansThai(
      fontWeight: _bold,
      fontSize: 24.0,
    ),
    displayMedium: GoogleFonts.ibmPlexSansThai(
      fontWeight: _semiBold,
      fontSize: 22.0,
    ),
    displaySmall: GoogleFonts.ibmPlexSansThai(
      fontWeight: _semiBold,
      fontSize: 20.0,
    ),
    headlineLarge: GoogleFonts.ibmPlexSansThai(
      fontWeight: _regular,
      fontSize: 24.0,
    ),
    headlineMedium: GoogleFonts.ibmPlexSansThai(
      fontWeight: _regular,
      fontSize: 22.0,
    ),
    headlineSmall: GoogleFonts.ibmPlexSansThai(
      fontWeight: _regular,
      fontSize: 20.0,
    ),
    titleLarge: GoogleFonts.ibmPlexSansThai(
      fontWeight: _semiBold,
      fontSize: 18.0,
    ),
    titleMedium: GoogleFonts.ibmPlexSansThai(
      fontWeight: _semiBold,
      fontSize: 16.0,
    ),
    titleSmall: GoogleFonts.ibmPlexSansThai(
      fontWeight: _semiBold,
      fontSize: 14.0,
    ),
    bodyLarge: GoogleFonts.ibmPlexSansThai(
      fontWeight: _regular,
      fontSize: 18.0,
    ),
    bodyMedium: GoogleFonts.ibmPlexSansThai(
      fontWeight: _regular,
      fontSize: 16.0,
    ),
    bodySmall: GoogleFonts.ibmPlexSansThai(
      fontWeight: _regular,
      fontSize: 14.0,
    ),
    labelLarge: GoogleFonts.ibmPlexSansThai(
      fontWeight: _light,
      fontSize: 14.0,
    ),
    labelMedium: GoogleFonts.ibmPlexSansThai(
      fontWeight: _light,
      fontSize: 12.0,
    ),
    labelSmall: GoogleFonts.ibmPlexSansThai(
      fontWeight: _light,
      fontSize: 10.0,
    ),
  );
}