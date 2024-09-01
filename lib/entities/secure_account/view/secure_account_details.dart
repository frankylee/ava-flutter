import 'package:ava_flutter/entities/secure_account/view/credit_limit_utilization/credit_limit_utilization_card.dart';
import 'package:ava_flutter/entities/secure_account/view/total_balance_utilization/total_balance_utilization_card.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecureAccountDetails extends ConsumerWidget {
  const SecureAccountDetails({super.key});

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
              context.l10n.accountDetails,
              style: context.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16.0),
          const CreditLimitUtilizationCard(),
          const SizedBox(height: 32.0),
          const TotalBalanceUtilizationCard(),
        ],
      ),
    );
  }
}
