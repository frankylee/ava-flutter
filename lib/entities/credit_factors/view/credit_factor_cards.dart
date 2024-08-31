import 'package:ava_flutter/entities/credit_factors/model/credit_factor.dart';
import 'package:ava_flutter/entities/credit_factors/view/credit_factor_card.dart';
import 'package:ava_flutter/entities/credit_factors/view_model/credit_factor_async_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditFactorCards extends ConsumerWidget {
  const CreditFactorCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            context.l10n.creditFactors,
            style: context.textTheme.titleLarge
                ?.copyWith(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 16.0),
        ref.watch(CreditFactorAsyncNotifier.provider).when(
              data: (data) => CreditFactorCardsData(creditFactors: data),
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const CreditFactorCardsLoading(),
            ),
      ],
    );
  }
}

@visibleForTesting
class CreditFactorCardsData extends StatelessWidget {
  const CreditFactorCardsData({
    super.key,
    required this.creditFactors,
  });

  final List<CreditFactor> creditFactors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: creditFactors.length,
        itemBuilder: (context, index) => Row(
          children: [
            CreditFactorCard(creditFactor: creditFactors.elementAt(index)),
            if (index < creditFactors.length - 1) const SizedBox(width: 8.0),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}

@visibleForTesting
class CreditFactorCardsLoading extends StatelessWidget {
  const CreditFactorCardsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) => Row(
          children: [
            const ShimmerContainer(
              borderRadius: 16.0,
              height: 160.0,
              width: 144.0,
            ),
            if (index < 3) const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}
