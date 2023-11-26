import 'package:flutter/material.dart';
import 'app_colors.dart';

final appTextTheme = const TextTheme().copyWith(
  displayLarge: const TextStyle(
    color: Color(0xFF182FFC),
    fontSize: 64,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: -0.57,
  ),
  displayMedium: const TextStyle(
    color: AppColors.textBlack,
    fontSize: 48,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: -0.57,
    height: 1,
  ),
  displaySmall: const TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontFamily: 'Graphik LCG',
    fontWeight: FontWeight.w500,
    letterSpacing: -1.86,
  ),
  headlineLarge: const TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontFamily: 'Graphik LCG',
    fontWeight: FontWeight.w500,
    letterSpacing: -1.86,
  ),
  titleLarge: const TextStyle(
    color: Color(0x8E434446),
    fontSize: 18,
    fontFamily: 'Graphik LCG',
    fontWeight: FontWeight.w600,
    letterSpacing: -0.57,
  ),
  titleMedium: const TextStyle(
    color: AppColors.textBlack,
    fontSize: 16,
    fontFamily: 'Graphik LCG',
    fontWeight: FontWeight.w500,
    letterSpacing: -0.57,
    height: 1.4,
  ),
  labelLarge: const TextStyle(
    color: Color(0xFFF7F7F7),
    fontSize: 16,
    fontFamily: 'Graphik LCG',
    fontWeight: FontWeight.w500,
    letterSpacing: -0.57,
  ),
  bodyLarge: const TextStyle(
    color: Color(0xFF434446),
    fontSize: 14,
    fontFamily: 'Graphik LCG',
    fontWeight: FontWeight.w500,
    letterSpacing: -0.30,
  ),
  bodySmall: const TextStyle(
    color: Color(0xFF434446),
    fontSize: 12,
    fontFamily: 'Graphik LCG',
    fontWeight: FontWeight.w500,
    letterSpacing: -0.30,
  ),
);
