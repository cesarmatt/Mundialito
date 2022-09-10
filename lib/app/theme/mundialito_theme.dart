import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MundialitoTheme {
  static Color _chameleon = Color(0xFFED1E79);
  static Color _great = Color(0xFF452B41);
  static Color _background = Color(0xFF333333);
  static Color _trequartista = Color(0xFF808080);
  static Color _shadowStriker = Color(0xFF666666);
  static Color _white = Color(0xFFF2F2F2);
  static Color _inputTextFill = Color(0xFFC5C5C5);


  static ThemeData buildTheme(BuildContext) {
    return ThemeData(
      primaryColor: _chameleon,
      scaffoldBackgroundColor: _background,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _inputTextFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: _chameleon),
        ),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: _white,
                fontSize: 36.0,
            )
        ),
        headline2: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: _chameleon,
              fontSize: 36.0,
            )
        ),
        bodyText1: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _shadowStriker,
            fontSize: 16.0
          )
        ),
        button: GoogleFonts.roboto(textStyle: TextStyle(color: _white)),
      )
    );
  }
}