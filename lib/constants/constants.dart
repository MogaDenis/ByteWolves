import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Add to this class all colors used.
class ColorConstants {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color deepPurple = Colors.deepPurple;

  // and so on...
}


// Add to this all fonts used.
class FontConstants {
  static String? roboto = GoogleFonts.roboto().fontFamily; 
  static String? lato = GoogleFonts.lato().fontFamily;
  static String? luxuriousRoman = GoogleFonts.luxuriousRoman().fontFamily;
  static String? openSans = GoogleFonts.openSans().fontFamily;

  // and so on...
}


const hintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const labelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final boxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);