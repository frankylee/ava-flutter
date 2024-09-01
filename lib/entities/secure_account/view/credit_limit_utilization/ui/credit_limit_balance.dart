import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditLimitBalance extends ConsumerWidget {
  const CreditLimitBalance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ref.watch(
          SecureAccountAsyncNotifier.provider.select(
            (asyncDetails) => asyncDetails.when(
              data: (data) => CreditLimitBalanceData(balance: data.balance),
              error: (error, stack) => const SizedBox.shrink(),
              loading: () => const CreditLimitBalanceLoading(),
            ),
          ),
        ),
        Text(
          context.l10n.balance,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

@visibleForTesting
class CreditLimitBalanceData extends StatelessWidget {
  const CreditLimitBalanceData({
    super.key,
    required this.balance,
  });

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.amountValue(balance.toInt()),
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

@visibleForTesting
class CreditLimitBalanceLoading extends StatelessWidget {
  const CreditLimitBalanceLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerContainer(height: 24.0, width: 64.0);
  }
}
