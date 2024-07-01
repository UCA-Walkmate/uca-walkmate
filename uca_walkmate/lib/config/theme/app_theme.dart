import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  
  ThemeData getTheme() => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff1A2130),
      primary: const Color(0xff1A2130),

    ), 
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.publicSans(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.publicSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: GoogleFonts.publicSans(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    )
  );

}