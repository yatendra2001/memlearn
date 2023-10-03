import 'package:flutter/material.dart';
import 'package:memlearn/src/utils/theme_constants.dart';

ThemeData memlearnTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor:
        AppColorTheme.kColorNotBlack, // Dark background color
    cardColor: AppColorTheme
        .kColorLightBlack, // Slightly lighter color for cards/widgets
    fontFamily: 'Gilroy',
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: AppColorTheme.kColorWhiteText,
          fontSize: 28,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: AppColorTheme.kColorWhiteText,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          color: AppColorTheme.kColorWhiteText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5),
      bodyLarge: TextStyle(
        color: AppColorTheme.kColorWhiteText,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
          color: AppColorTheme.kColorWhiteText,
          fontSize: 14,
          fontFamily: "Gilroy-SemiBold",
          letterSpacing: 0.5),
      bodySmall: TextStyle(
        color: AppColorTheme.kColorWhiteText,
        fontSize: 12,
        fontFamily: "Gilroy-SemiBold",
      ),
    ),
  );
}
