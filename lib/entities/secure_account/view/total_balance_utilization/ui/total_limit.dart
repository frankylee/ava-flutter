import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalLimit extends ConsumerWidget {
  const TotalLimit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          context.l10n.totalLimit,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.outline,
          ),
        ),
        const SizedBox(width: 4.0),
        ref.watch(
          SecureAccountAsyncNotifier.provider.select(
            (asyncDetails) => asyncDetails.when(
              data: (data) => TotalLimitData(availableBalance: data.totalLimit),
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const TotalLimitLoading(),
            ),
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
class TotalLimitData extends StatelessWidget {
  const TotalLimitData({
    super.key,
    required this.availableBalance,
  });

  final double availableBalance;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.amountValue(availableBalance.toInt()),
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.colors.outline,
      ),
    );
  }
}

@visibleForTesting
class TotalLimitLoading extends StatelessWidget {
  const TotalLimitLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerContainer(height: 16.0, width: 80.0);
  }
}
