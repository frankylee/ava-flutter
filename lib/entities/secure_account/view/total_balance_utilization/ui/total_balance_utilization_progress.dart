import 'package:ava_flutter/entities/secure_account/model/secure_account.dart';
import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalBalanceUtilizationProgress extends ConsumerWidget {
  const TotalBalanceUtilizationProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(SecureAccountAsyncNotifier.provider).when(
          data: (data) => TotalBalanceUtilizationProgressData(account: data),
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const TotalBalanceUtilizationProgressLoading(),
        );
  }
}

@visibleForTesting
class TotalBalanceUtilizationProgressData extends StatelessWidget {
  const TotalBalanceUtilizationProgressData({
    super.key,
    required this.account,
  });

  final SecureAccount account;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: 0.25,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: account.totalBalance / account.totalLimit,
            ),
            duration: const Duration(milliseconds: 1500),
            builder: (context, value, _) => SizedBox(
              height: 72.0,
              width: 72.0,
              child: CircularProgressIndicator(
                value: value,
                backgroundColor: context.colors.secondaryContainer,
                color: context.colors.secondary,
                semanticsLabel: context.l10n.utilization,
                semanticsValue: '${account.utilization}%',
                strokeWidth: 6.0,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              '${(account.utilization * 100).toInt()}%',
              style: context.textTheme.displaySmall?.copyWith(
                fontSize: 36.0,
                height: 1.0,
              ),
            ),
            Text(
              account.quality,
              style: const TextStyle(
                fontSize: 8.0,
                fontWeight: FontWeight.w600,
                height: 1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

@visibleForTesting
class TotalBalanceUtilizationProgressLoading extends StatelessWidget {
  const TotalBalanceUtilizationProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.0,
      width: 72.0,
      child: CircularProgressIndicator(
        color: context.colors.secondary,
        strokeWidth: 6.0,
      ),
    );
  }
}
