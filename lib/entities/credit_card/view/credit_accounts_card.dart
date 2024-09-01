import 'package:ava_flutter/entities/credit_card/model/credit_card.dart';
import 'package:ava_flutter/entities/credit_card/view_model/credit_card_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreditAccountsCard extends ConsumerWidget {
  const CreditAccountsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              context.l10n.openCreditCardAccounts,
              style: context.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            decoration: ShapeDecoration(
              color: context.colors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
                side: BorderSide(color: context.colors.scrim.withOpacity(0.15)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ref.watch(CreditCardAsyncNotifier.provider).when(
                    data: (data) => CreditAccountsCardData(accounts: data),
                    error: (error, stack) => const SizedBox.shrink(),
                    loading: () => const CreditAccountsLoading(),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
class CreditAccountsCardData extends StatelessWidget {
  CreditAccountsCardData({
    super.key,
    required this.accounts,
  });

  final List<CreditCard> accounts;

  final DateFormat _dateFormatter = DateFormat('MMMM d, yyyy');

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts.elementAt(index);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  account.name,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  '${(account.utilization * 100).toInt()}%',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0.0,
                end: account.balance / account.creditLimit,
              ),
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, _) => LinearProgressIndicator(
                borderRadius: BorderRadius.circular(12.0),
                value: value,
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.amountBalance(account.balance.toInt()),
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  context.l10n.amountLimit(account.creditLimit.toInt()),
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              context.l10n
                  .reportedOn(_dateFormatter.format(account.lastReportedOn)),
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.colors.outline),
            ),
          ],
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Divider(),
      ),
      shrinkWrap: true,
    );
  }
}

@visibleForTesting
class CreditAccountsLoading extends StatelessWidget {
  const CreditAccountsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) => const ShimmerContainer(
        borderRadius: 8.0,
        height: 124.0,
        width: 600.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      shrinkWrap: true,
    );
  }
}
