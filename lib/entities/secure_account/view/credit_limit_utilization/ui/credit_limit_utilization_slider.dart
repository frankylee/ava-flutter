import 'package:ava_flutter/entities/secure_account/model/secure_account.dart';
import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditLimitUtilizationSlider extends ConsumerWidget {
  const CreditLimitUtilizationSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(SecureAccountAsyncNotifier.provider).when(
          data: (data) => CreditLimitUtilizationSliderData(account: data),
          error: (error, stack) => const SizedBox.shrink(),
          loading: () => const CreditLimitUtilizationSliderLoading(),
        );
  }
}

@visibleForTesting
class CreditLimitUtilizationSliderData extends ConsumerStatefulWidget {
  const CreditLimitUtilizationSliderData({
    super.key,
    required this.account,
  });

  final SecureAccount account;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreditLimitUtilizationSliderDataState();
}

class _CreditLimitUtilizationSliderDataState
    extends ConsumerState<CreditLimitUtilizationSliderData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: context.colors.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              height: 8.0,
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.0,
                end: widget.account.balance,
              ),
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, _) {
                return Slider(
                  label: '\$${value.toInt()}',
                  min: 0,
                  max: widget.account.spendLimit,
                  value: value,
                  onChanged: (value) {},
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.spendLimit(100),
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(width: 4.0),
            InkWell(
              enableFeedback: true,
              onTap: () => HapticFeedback.lightImpact(),
              child: Text(
                context.l10n.whyIsItDifferent,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onPrimaryFixedVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

@visibleForTesting
class CreditLimitUtilizationSliderLoading extends StatelessWidget {
  const CreditLimitUtilizationSliderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: context.colors.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              height: 8.0,
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: 1.0,
              ),
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, _) {
                return Slider(
                  min: 0,
                  max: 1.0,
                  value: value,
                  onChanged: (value) {},
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        const ShimmerContainer(height: 16.0, width: 600.0),
      ],
    );
  }
}
