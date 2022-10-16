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

  static Color getPrimaryColor() {
    return _chameleon;
  }

  static Color getOnPrimaryColor() {
    return _white;
  }

  static Color getOnSurfaceColor() {
    return _great;
  }

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
        iconColor: _chameleon,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        fillColor: _chameleon,
        color: _white,
        selectedBorderColor: _chameleon,
        borderColor: _inputTextFill
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _chameleon,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            textStyle: TextStyle(
              color: _white,
            ),
        )
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
        headline3: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _white,
            fontSize: 18,
          )
        ),
        headline4: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _white,
            fontSize: 16,
            fontWeight: FontWeight.w200
          )
        ),
        headline5: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: _white,
              fontSize: 28,
            )
        ),
        bodyText1: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _shadowStriker,
            fontSize: 16.0
          )
        ),
        bodyText2: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _white,
            fontSize: 20.0
          )
        ),
        button: GoogleFonts.roboto(textStyle: TextStyle(color: _white)),
        caption: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _chameleon,
            fontSize: 16
          )
        )
      ),
      appBarTheme: AppBarTheme(
        color: _background,
        elevation: 0
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: _white,
        backgroundColor: _chameleon,
        unselectedItemColor: _great,
      ),
      iconTheme: IconThemeData(
        color: _chameleon
      ),
    );
  }
}