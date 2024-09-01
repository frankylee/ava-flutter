import 'package:flutter/material.dart';

class RectSliderThumbShape extends SliderComponentShape {
  const RectSliderThumbShape({
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(width, height);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    assert(sliderTheme.thumbColor != null);

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: center,
          height: height,
          width: width,
        ),
        Radius.zero,
      ),
      Paint()..color = sliderTheme.thumbColor!,
    );
  }
}
