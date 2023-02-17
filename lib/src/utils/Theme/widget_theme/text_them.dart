import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

class WidgetTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displaySmall: GoogleFonts.montserrat(
          color: const Color.fromARGB(189, 0, 0, 0),
          fontSize: 35,
          fontWeight: FontWeight.bold),
      titleSmall: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
      ),
      headlineMedium: GoogleFonts.archivo(
        color: tDarkColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 28,
      ));

  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white70,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
    ),
  );
}
