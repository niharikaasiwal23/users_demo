import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          labelLarge: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 28),
          labelMedium: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          labelSmall: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              letterSpacing: 0.0,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              color: Colors.white, fontSize: 12, fontFamily: 'Poppins'),
          ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 4.0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actionsIconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600)),
      inputDecorationTheme: InputDecorationTheme(
           border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          isDense: true));
}
