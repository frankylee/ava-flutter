import 'package:flutter/material.dart';

const atHaussFontFamily = 'AtHauss';
const atSlamFontFamily = 'AtSlam';
const packageName = 'ava_flutter';

TextTheme createTextTheme(BuildContext context) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  return baseTextTheme.copyWith(
    displayLarge: TextStyle(
      fontFamily: atSlamFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    displayMedium: TextStyle(
      fontFamily: atSlamFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    displaySmall: TextStyle(
      fontFamily: atSlamFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    headlineLarge: TextStyle(
      fontFamily: atHaussFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      fontFamily: atHaussFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    headlineSmall: TextStyle(
      fontFamily: atHaussFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    titleLarge: TextStyle(
      fontFamily: atHaussFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    titleMedium: TextStyle(
      fontFamily: atHaussFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    titleSmall: TextStyle(
      fontFamily: atHaussFontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    bodyLarge: TextStyle(
      fontFamily: atHaussFontFamily,
      color: colorScheme.onSurface,
    ),
    bodyMedium: TextStyle(
      fontFamily: atHaussFontFamily,
      color: colorScheme.onSurface,
    ),
    bodySmall: TextStyle(
      fontFamily: atHaussFontFamily,
      color: colorScheme.onSurface,
    ),
  );
}
