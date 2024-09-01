import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryFilledButton extends StatelessWidget {
  const PrimaryFilledButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed != null
          ? () {
              HapticFeedback.lightImpact();
              onPressed!.call();
            }
          : null,
      child: Text(
        label,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colors.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
