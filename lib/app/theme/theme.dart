import 'package:ava_flutter/app/theme/rect_slider_thumb_shape.dart';
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
      secondary: Color(0xFF48A388),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFA9EACE),
      onSecondaryContainer: Color(0xFF002118),
      tertiary: Color(0xFFFF7E17),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFDBC8),
      onTertiaryContainer: Color(0xFF321200),
      error: Color(0xFFDD1338),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD9),
      onErrorContainer: Color(0xFF3B080D),
      surface: Color(0xFFF7FBF2),
      onSurface: Color(0xFF2A1E39),
      onSurfaceVariant: Color(0xFF4A454E),
      outline: Color(0xFF736B7C),
      outlineVariant: Color(0xFFD8D5D9),
      shadow: Color(0xFFC26060),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2D322C),
      inversePrimary: Color(0xFFD6BBFB),
      primaryFixed: Color(0xFFEDDCFF),
      onPrimaryFixed: Color(0xFF250E44),
      primaryFixedDim: Color(0xFFD6BBFB),
      onPrimaryFixedVariant: Color(0xFFA448FF),
      secondaryFixed: Color(0xFFA3F2D6),
      onSecondaryFixed: Color(0xFF002118),
      secondaryFixedDim: Color(0xFF88D6BB),
      onSecondaryFixedVariant: Color(0xFF003928),
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

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        brightness: colorScheme.brightness,
        canvasColor: colorScheme.surface,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData(
          dragHandleColor: colorScheme.onPrimaryFixedVariant,
          dragHandleSize: const Size(0.0, 0.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
            elevation: const WidgetStatePropertyAll(0),
            enableFeedback: true,
            foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
            minimumSize: const WidgetStatePropertyAll(
              Size(double.maxFinite, 44.0),
            ),
            overlayColor:
                WidgetStatePropertyAll(colorScheme.onSurface.withOpacity(0.15)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            textStyle: WidgetStatePropertyAll(
              textTheme.bodyLarge?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: MaterialStateOutlineInputBorder.resolveWith(
            (states) => OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: colorScheme.outlineVariant),
            ),
          ),
          fillColor: colorScheme.onPrimary,
          filled: true,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            enableFeedback: true,
            minimumSize: const WidgetStatePropertyAll(
              Size(double.maxFinite, 44.0),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            side: WidgetStatePropertyAll(
              BorderSide(color: colorScheme.primary, width: 2.0),
            ),
            textStyle: WidgetStatePropertyAll(
              textTheme.bodyLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colorScheme.secondary,
          linearMinHeight: 8.0,
          linearTrackColor: colorScheme.scrim.withOpacity(0.15),
        ),
        sliderTheme: SliderThemeData(
          activeTickMarkColor: Colors.transparent,
          activeTrackColor: colorScheme.secondaryContainer,
          inactiveTickMarkColor: Colors.transparent,
          inactiveTrackColor: colorScheme.secondaryContainer,
          overlayShape: SliderComponentShape.noThumb,
          secondaryActiveTrackColor: colorScheme.secondary,
          showValueIndicator: ShowValueIndicator.always,
          thumbColor: colorScheme.secondary,
          thumbShape: const RectSliderThumbShape(height: 8.0, width: 4.0),
          trackHeight: 8.0,
          trackShape: const RectangularSliderTrackShape(),
          valueIndicatorColor: colorScheme.primary,
          valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
        ),
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
