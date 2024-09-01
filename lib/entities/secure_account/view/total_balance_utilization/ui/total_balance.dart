import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalBalance extends ConsumerWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          context.l10n.totalBalance,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 4.0),
        ref.watch(
          SecureAccountAsyncNotifier.provider.select(
            (asyncDetails) => asyncDetails.when(
              data: (data) => TotalBalanceData(totalBalance: data.totalBalance),
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const TotalBalanceLoading(),
            ),
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
class TotalBalanceData extends StatelessWidget {
  const TotalBalanceData({
    super.key,
    required this.totalBalance,
  });

  final double totalBalance;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.amountValue(totalBalance.toInt()),
      style: context.textTheme.bodyLarge?.copyWith(
        color: context.colors.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

@visibleForTesting
class TotalBalanceLoading extends StatelessWidget {
  const TotalBalanceLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerContainer(height: 24.0, width: 100.0);
  }
}
