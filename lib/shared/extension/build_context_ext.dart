import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ava_l10n.dart';

extension BuildContextExt on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  AvaL10n get l10n => AvaL10n.of(this)!;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
