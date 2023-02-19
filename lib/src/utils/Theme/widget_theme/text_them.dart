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
      ),
      headlineSmall: GoogleFonts.openSans(
        color: Colors.black87,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900,
        fontSize: 24,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: tDarkColor,
        fontSize: 58,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodySmall: GoogleFonts.openSans(
          color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold));

  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color:const  Color.fromARGB(208, 255, 255, 255),
    ),
    titleSmall: GoogleFonts.poppins(
      color:const  Color.fromARGB(199, 255, 255, 255),
      fontSize: 24,
    ),
    displaySmall: GoogleFonts.montserrat(
          color: const Color.fromARGB(188, 255, 255, 255),
          fontSize: 35,
          fontWeight: FontWeight.bold),
      headlineMedium: GoogleFonts.archivo(
        color: tPrimaryColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 28,
      ),
      headlineSmall: GoogleFonts.openSans(
        color: const Color.fromARGB(247, 255, 255, 255),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900,
        fontSize: 24,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: tPrimaryColor,
        fontSize: 58,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.roboto(
        color:const  Color.fromARGB(219, 255, 255, 255),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodySmall: GoogleFonts.openSans(
          color:const Color.fromARGB(236, 255, 255, 255), fontSize: 16, fontWeight: FontWeight.bold)
  );
}
