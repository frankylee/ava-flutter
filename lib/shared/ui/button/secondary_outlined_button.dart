import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondaryOutlinedButton extends StatelessWidget {
  const SecondaryOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed != null
          ? () {
              HapticFeedback.lightImpact();
              onPressed!.call();
            }
          : null,
      child: Text(
        label,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
