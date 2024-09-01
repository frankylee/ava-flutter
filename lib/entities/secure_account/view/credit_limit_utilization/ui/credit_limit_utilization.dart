import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditLimitUtilization extends ConsumerWidget {
  const CreditLimitUtilization({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.l10n.utilization,
          style: context.textTheme.bodyLarge,
        ),
        ref.watch(
          SecureAccountAsyncNotifier.provider.select(
            (asyncDetails) => asyncDetails.when(
              data: (data) =>
                  CreditLimitUtilizationData(utilization: data.utilization),
              error: (error, stack) => const SizedBox.shrink(),
              loading: () => const CreditLimitUtilizationLoading(),
            ),
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
class CreditLimitUtilizationData extends StatelessWidget {
  const CreditLimitUtilizationData({
    super.key,
    required this.utilization,
  });

  final double utilization;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(utilization * 100).toInt()}%',
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

@visibleForTesting
class CreditLimitUtilizationLoading extends StatelessWidget {
  const CreditLimitUtilizationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerContainer(height: 24.0, width: 48.0);
  }
}
