import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditLimit extends ConsumerWidget {
  const CreditLimit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ref.watch(
          SecureAccountAsyncNotifier.provider.select(
            (asyncDetails) => asyncDetails.when(
              data: (data) => CreditLimitData(creditLimit: data.creditLimit),
              error: (error, stack) => const SizedBox.shrink(),
              loading: () => const CreditLimitLoading(),
            ),
          ),
        ),
        Text(
          context.l10n.creditLimit,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

@visibleForTesting
class CreditLimitData extends StatelessWidget {
  const CreditLimitData({
    super.key,
    required this.creditLimit,
  });

  final double creditLimit;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.amountValue(creditLimit.toInt()),
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

@visibleForTesting
class CreditLimitLoading extends StatelessWidget {
  const CreditLimitLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerContainer(height: 24.0, width: 80.0);
  }
}
