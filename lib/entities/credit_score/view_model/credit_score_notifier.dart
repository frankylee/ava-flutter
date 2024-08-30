import 'dart:async';

import 'package:ava_flutter/entities/credit_score/model/credit_score.dart';
import 'package:ava_flutter/entities/credit_score/view_model/credit_score_history_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditScoreAsyncNotifier extends AsyncNotifier<CreditScore> {
  static final provider =
      AsyncNotifierProvider<CreditScoreAsyncNotifier, CreditScore>(
    CreditScoreAsyncNotifier.new,
  );

  @override
  FutureOr<CreditScore> build() async {
    ref.watch(CreditScoreHistoryAsyncNotifier.provider);
    final result =
        await ref.read(CreditScoreHistoryAsyncNotifier.provider.future);
    // We know the history is sorted in reverse-chronological order with the most
    // recent reporting as the first item.
    return result.history.first;
  }

  /// Determine if the last update occurred "today".
  bool isLastUpdateToday() {
    final creditScore = state.valueOrNull;
    if (creditScore == null) return false;
    // Extract the dates without a timestamp for comnparison.
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastUpdate = DateTime(
      creditScore.lastUpdate.year,
      creditScore.lastUpdate.month,
      creditScore.lastUpdate.day,
    );
    return lastUpdate == today;
  }
}
