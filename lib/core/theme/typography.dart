import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Class defining the text theme for the application using Google Fonts.
class AppTextTheme {
  const AppTextTheme._();

  /// Text theme configuration with various font styles and sizes.
  static final textTheme = TextTheme(
    // Large display text style.
    displayLarge: GoogleFonts.poppins(
      fontSize: 57,
      height: 64 / 57,
      letterSpacing: -0.25,
    ),

    // Medium display text style.
    displayMedium: GoogleFonts.poppins(
      fontSize: 45,
      height: 52 / 45,
    ),

    // Small display text style.
    displaySmall: GoogleFonts.poppins(
      fontSize: 36,
      height: 44 / 36,
    ),

    // Large headline text style with bold font weight.
    headlineLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 32,
      height: 40 / 32,
    ),

    // Medium headline text style.
    headlineMedium: GoogleFonts.poppins(
      fontSize: 28,
      height: 36 / 28,
    ),

    // Small headline text style.
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      height: 32 / 24,
    ),

    // Large title text style.
    titleLarge: GoogleFonts.poppins(
      fontSize: 22,
      height: 28 / 22,
    ),

    // Medium title text style with a slight letter-spacing.
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.1,
    ),

    // Small title text style with a slight letter-spacing.
    titleSmall: GoogleFonts.poppins(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1,
    ),

    // Large label text style.
    labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      height: 20 / 14,
    ),

    // Medium label text style.
    labelMedium: GoogleFonts.poppins(
      fontSize: 12,
      height: 16 / 12,
    ),

    // Small label text style.
    labelSmall: GoogleFonts.poppins(
      fontSize: 11,
      height: 16 / 11,
    ),

    // Large body text style.
    bodyLarge: GoogleFonts.poppins(
      fontSize: 13,
      height: 24 / 16,
    ),

    // Medium body text style.
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      height: 20 / 14,
    ),

    // Small body text style.
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      height: 16 / 12,
    ),
  );
}
