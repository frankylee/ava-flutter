import 'package:ava_flutter/entities/credit_score/model/credit_score.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_progress.dart';
import 'package:ava_flutter/entities/credit_score/view_model/credit_score_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/hero_card.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreditScoreHeroCard extends ConsumerWidget {
  const CreditScoreHeroCard({
    super.key,
    required this.reportingAgency,
  });

  final String reportingAgency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HeroCard(
      child: Container(
        decoration: ShapeDecoration(
          color: context.colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ref.watch(CreditScoreAsyncNotifier.provider).when(
                    data: (data) => CreditScoreHeroHeaderData(
                      creditScore: data,
                      reportingAgency: reportingAgency,
                    ),
                    error: (error, stackTrace) {
                      ref.invalidate(CreditScoreAsyncNotifier.provider);
                      return const SizedBox.shrink();
                    },
                    loading: () => const CreditScoreHeroHeaderLoading(),
                  ),
              const CreditScoreProgress(),
            ],
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class CreditScoreHeroHeaderData extends ConsumerWidget {
  const CreditScoreHeroHeaderData({
    super.key,
    required this.creditScore,
    required this.reportingAgency,
  });

  final CreditScore creditScore;
  final String reportingAgency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormatter = DateFormat.MMMMd();
    final isLastUpdateToday = ref
        .read(CreditScoreAsyncNotifier.provider.notifier)
        .isLastUpdateToday();
    final lastUpdateFormatted = isLastUpdateToday
        ? context.l10n.today
        : dateFormatter.format(creditScore.lastUpdate);
    final nextUpdateFormatted = dateFormatter.format(creditScore.nextUpdate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              context.l10n.creditScore,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8.0),
            Container(
              decoration: ShapeDecoration(
                color: context.colors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
              height: 20.0,
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                '${creditScore.score >= 0 ? '+' : '-'}${creditScore.changeSinceLast}${context.l10n.pts}',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Text(
          '${context.l10n.updated} $lastUpdateFormatted | ${context.l10n.nextCreditReportingOn(nextUpdateFormatted)}',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: context.colors.outline),
        ),
        const SizedBox(height: 8.0),
        Text(
          reportingAgency,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onPrimaryFixedVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
class CreditScoreHeroHeaderLoading extends StatelessWidget {
  const CreditScoreHeroHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainer(height: 24.0, width: 160.0),
        SizedBox(height: 4.0),
        ShimmerContainer(height: 24.0, width: 200.0),
        SizedBox(height: 4.0),
        ShimmerContainer(height: 16.0, width: 60.0),
      ],
    );
  }
}
