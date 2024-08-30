import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Creates the app text theme using Google Fonts package for downloadable fonts.
TextTheme createTextTheme(BuildContext context) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme('Nunito', baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme('Nunito', baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
