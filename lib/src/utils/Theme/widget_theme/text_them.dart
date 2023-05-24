import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

class WidgetTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displaySmall: GoogleFonts.poppins(
        color: Colors.black87, fontSize: 35, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: tPrimaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      fontSize: 28,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: Colors.black87,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    titleLarge: GoogleFonts.montserrat(
      color: tDarkColor,
      fontSize: 58,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    bodySmall: GoogleFonts.openSans(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.openSans(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displaySmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.openSans(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: tSecondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      fontSize: 28,
    ),
    headlineSmall: GoogleFonts.openSans(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontSize: 24,
    ),
    titleLarge: GoogleFonts.montserrat(
      color: tDarkColor,
      fontSize: 58,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    bodySmall: GoogleFonts.openSans(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.openSans(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  );
}
