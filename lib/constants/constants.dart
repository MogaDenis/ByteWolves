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

class CustomTextStyles {
  static const hintTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );

  static const textFieldTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'OpenSans',
  );

  static const labelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );
}

class CustomBoxDecorations {
  static final boxDecorationStyle = BoxDecoration(
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
}

class ImagesConstants {
  static const String logoImage = 'assets/images/logo.png';
  static const String fullWolfImage = 'assets/images/full_wolf.png';
}

class StringConstants {
  static const String profileTitle = 'Profile';
}

class CustomContainers {
  // This container is used as a background, put it as the first child of a "Stack" widget.
  static final backgroundContainer = Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF73AEF5),
          Color(0xFF61A4F1),
          Color(0xFF478DE0),
          Color(0xFF398AE5),
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      ),
    ),
  );
}

class ApiConstants {
  static String baseUrl = 'http://localhost:5232/api';

  // For get all/add it's just the url, for update/delete/get by id it's the url/id
  static String lecturesUrl = '$baseUrl/lectures';
  static String questionsUrl = '$baseUrl/questions';
  static String usersUrl = '$baseUrl/users';
}
