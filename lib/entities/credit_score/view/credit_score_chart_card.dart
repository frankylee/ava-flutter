import 'package:ava_flutter/entities/credit_score/model/credit_score_history.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_card_header.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_chart.dart';
import 'package:ava_flutter/entities/credit_score/view_model/credit_score_history_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditScoreChartCard extends ConsumerWidget {
  const CreditScoreChartCard({super.key});

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
              context.l10n.chart,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CreditScoreCardHeader(),
                  const SizedBox(height: 20.0),
                  ref.watch(CreditScoreHistoryAsyncNotifier.provider).when(
                        data: (data) => CreditScoreChartCardData(history: data),
                        error: (error, stackTrace) => const SizedBox.shrink(),
                        loading: () => const CreditScoreChartCardLoading(),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
class CreditScoreChartCardData extends StatelessWidget {
  const CreditScoreChartCardData({
    super.key,
    required this.history,
  });

  final CreditScoreHistory history;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreditScoreChart(history: history),
        const SizedBox(height: 24.0),
        Center(
          child: Column(
            children: [
              Text(
                context.l10n.last12Months,
                style: context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                context.l10n.scoreCalculatedUsing(history.calculatedBy),
                style: context.textTheme.bodySmall
                    ?.copyWith(color: context.colors.outline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
class CreditScoreChartCardLoading extends StatelessWidget {
  const CreditScoreChartCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShimmerContainer(height: 124.0, width: double.maxFinite),
        SizedBox(height: 24.0),
        ShimmerContainer(height: 16.0, width: 160.0),
        SizedBox(height: 4.0),
        ShimmerContainer(height: 16.0, width: double.maxFinite),
      ],
    );
  }
}
