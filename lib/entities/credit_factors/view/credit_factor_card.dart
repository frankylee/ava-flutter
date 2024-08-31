import 'package:ava_flutter/entities/credit_factors/model/credit_factor.dart';
import 'package:ava_flutter/entities/credit_factors/view/credit_factor_impact_button.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditFactorCard extends ConsumerWidget {
  const CreditFactorCard({
    super.key,
    required this.creditFactor,
  });

  final CreditFactor creditFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: ShapeDecoration(
        color: context.colors.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: context.colors.scrim.withOpacity(0.15),
          ),
        ),
      ),
      width: 144.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              creditFactor.title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${creditFactor.percentage.toInt()}%',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            CreditFactorImpactButton(impact: creditFactor.impact),
          ],
        ),
      ),
    );
  }
}
