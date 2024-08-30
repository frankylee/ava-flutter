import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme(this.textTheme);

  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF420085),
      surfaceTint: Color(0xFF420085),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFEDDCFF),
      onPrimaryContainer: Color(0xFF250E44),
      secondary: Color(0xFF146B55),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFA3F2D6),
      onSecondaryContainer: Color(0xFF002118),
      tertiary: Color(0xFF8C4F27),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFDBC8),
      onTertiaryContainer: Color(0xFF321200),
      error: Color(0xFF904A4B),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD9),
      onErrorContainer: Color(0xFF3B080D),
      surface: Color(0xFFF7FBF2),
      onSurface: Color(0xFF181D17),
      onSurfaceVariant: Color(0xFF4A454E),
      outline: Color(0xFF7B757F),
      outlineVariant: Color(0xFFCBC4CF),
      shadow: Color(0xFFC26060),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2D322C),
      inversePrimary: Color(0xFFD6BBFB),
      primaryFixed: Color(0xFFEDDCFF),
      onPrimaryFixed: Color(0xFF250E44),
      primaryFixedDim: Color(0xFFD6BBFB),
      onPrimaryFixedVariant: Color(0xFF523C73),
      secondaryFixed: Color(0xFFA3F2D6),
      onSecondaryFixed: Color(0xFF002118),
      secondaryFixedDim: Color(0xFF88D6BB),
      onSecondaryFixedVariant: Color(0xFF00513F),
      tertiaryFixed: Color(0xFFFFDBC8),
      onTertiaryFixed: Color(0xFF321200),
      tertiaryFixedDim: Color(0xFFFFB68B),
      onTertiaryFixedVariant: Color(0xFF6F3811),
      surfaceDim: Color(0xFFD7DBD3),
      surfaceBright: Color(0xFFF7FBF2),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF1F5EC),
      surfaceContainer: Color(0xFFEBEFE6),
      surfaceContainerHigh: Color(0xFFE6E9E1),
      surfaceContainerHighest: Color(0xFFE0E4DB),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFD6BBFB),
      surfaceTint: Color(0xFFD6BBFB),
      onPrimary: Color(0xFF3B255B),
      primaryContainer: Color(0xFF523C73),
      onPrimaryContainer: Color(0xFFEDDCFF),
      secondary: Color(0xFF88D6BB),
      onSecondary: Color(0xFF00382B),
      secondaryContainer: Color(0xFF00513F),
      onSecondaryContainer: Color(0xFFA3F2D6),
      tertiary: Color(0xFFFFB68B),
      onTertiary: Color(0xFF522300),
      tertiaryContainer: Color(0xFF6F3811),
      onTertiaryContainer: Color(0xFFFFDBC8),
      error: Color(0xFFFFB3B2),
      onError: Color(0xFF561D20),
      errorContainer: Color(0xFF733334),
      onErrorContainer: Color(0xFFFFDAD9),
      surface: Color(0xFF101410),
      onSurface: Color(0xFFE0E4DB),
      onSurfaceVariant: Color(0xFFCBC4CF),
      outline: Color(0xFF958E99),
      outlineVariant: Color(0xFF4A454E),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE0E4DB),
      inversePrimary: Color(0xFF420085),
      primaryFixed: Color(0xFFEDDCFF),
      onPrimaryFixed: Color(0xFF250E44),
      primaryFixedDim: Color(0xFFD6BBFB),
      onPrimaryFixedVariant: Color(0xFF523C73),
      secondaryFixed: Color(0xFFA3F2D6),
      onSecondaryFixed: Color(0xFF002118),
      secondaryFixedDim: Color(0xFF88D6BB),
      onSecondaryFixedVariant: Color(0xFF00513F),
      tertiaryFixed: Color(0xFFFFDBC8),
      onTertiaryFixed: Color(0xFF321200),
      tertiaryFixedDim: Color(0xFFFFB68B),
      onTertiaryFixedVariant: Color(0xFF6F3811),
      surfaceDim: Color(0xff101410),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff181d17),
      surfaceContainer: Color(0xff1c211b),
      surfaceContainerHigh: Color(0xff272b26),
      surfaceContainerHighest: Color(0xff313630),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });

  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
