import 'package:ava_flutter/entities/credit_score/model/credit_score.dart';
import 'package:ava_flutter/entities/credit_score/view_model/credit_score_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditScoreProgress extends ConsumerWidget {
  const CreditScoreProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(CreditScoreAsyncNotifier.provider).when(
          data: (data) => CreditScoreProgressData(creditScore: data),
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const CreditScoreProgressLoading(),
        );
  }
}

@visibleForTesting
class CreditScoreProgressData extends StatelessWidget {
  const CreditScoreProgressData({
    super.key,
    required this.creditScore,
  });

  final CreditScore creditScore;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.flip(
          flipX: true,
          flipY: true,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: (creditScore.score - 500) / 350,
            ),
            duration: const Duration(milliseconds: 1500),
            builder: (context, value, _) => SizedBox(
              height: 72.0,
              width: 72.0,
              child: CircularProgressIndicator(
                value: value,
                backgroundColor: context.colors.secondaryContainer,
                color: context.colors.secondary,
                semanticsLabel: context.l10n.creditScoreProgress,
                semanticsValue: context.l10n.scoreOutOf850(creditScore.score),
                strokeWidth: 6.0,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              '${creditScore.score}',
              style: context.textTheme.displaySmall?.copyWith(
                fontSize: 36.0,
                letterSpacing: -3,
                height: 1.0,
              ),
            ),
            Text(
              creditScore.quality,
              style: const TextStyle(
                fontSize: 10.0,
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
class CreditScoreProgressLoading extends StatelessWidget {
  const CreditScoreProgressLoading({super.key});

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
