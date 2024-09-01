import 'package:ava_flutter/entities/credit_factors/model/credit_factor_impact.enum.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditFactorImpactButton extends StatelessWidget {
  const CreditFactorImpactButton({
    super.key,
    required this.impact,
  });

  final CreditFactorImpact impact;

  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color textColor = context.colors.onSecondary;
    if (impact == CreditFactorImpact.high) {
      backgroundColor = context.colors.onSecondaryFixedVariant;
    } else if (impact == CreditFactorImpact.med) {
      backgroundColor = context.colors.secondary;
    } else {
      backgroundColor = context.colors.secondaryContainer;
      textColor = context.colors.onSecondaryFixedVariant;
    }
    return TextButton(
      onPressed: () => HapticFeedback.lightImpact(),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
      child: Text(
        '${impact.name.toUpperCase()} ${context.l10n.impact}',
        style: context.textTheme.labelSmall
            ?.copyWith(color: textColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
