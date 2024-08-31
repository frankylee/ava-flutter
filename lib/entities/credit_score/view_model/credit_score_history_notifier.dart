import 'dart:async';

import 'package:ava_flutter/entities/credit_score/model/credit_score.dart';
import 'package:ava_flutter/entities/credit_score/model/credit_score_history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditScoreHistoryAsyncNotifier
    extends AsyncNotifier<CreditScoreHistory> {
  static final provider = AsyncNotifierProvider<CreditScoreHistoryAsyncNotifier,
      CreditScoreHistory>(CreditScoreHistoryAsyncNotifier.new);

  @override
  FutureOr<CreditScoreHistory> build() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return CreditScoreHistory(
      calculatedBy: 'VantageScore 3.0',
      reportingAgency: 'Experian',
      history: [
        CreditScore(
          changeSinceLast: 2,
          lastUpdate: DateTime.now(),
          nextUpdate: DateTime(2024, 5, 12),
          quality: 'Good',
          score: 720,
        ),
        CreditScore(
          changeSinceLast: -4,
          lastUpdate: DateTime.now(),
          nextUpdate: DateTime(2024, 5, 12),
          quality: 'Good',
          score: 696,
        ),
        CreditScore(
          changeSinceLast: 27,
          lastUpdate: DateTime(2024, 3, 12),
          nextUpdate: DateTime(2024, 4, 12),
          quality: 'Good',
          score: 700,
        ),
        CreditScore(
          changeSinceLast: 25,
          nextUpdate: DateTime(2024, 3, 12),
          lastUpdate: DateTime(2024, 2, 12),
          quality: 'Good',
          score: 675,
        ),
        CreditScore(
          changeSinceLast: -9,
          lastUpdate: DateTime(2024, 1, 12),
          nextUpdate: DateTime(2024, 2, 12),
          quality: 'Good',
          score: 650,
        ),
        CreditScore(
          changeSinceLast: 9,
          lastUpdate: DateTime(2023, 12, 12),
          nextUpdate: DateTime(2024, 1, 12),
          quality: 'Good',
          score: 659,
        ),
        CreditScore(
          changeSinceLast: -18,
          lastUpdate: DateTime(2023, 11, 12),
          nextUpdate: DateTime(2023, 12, 12),
          quality: 'Good',
          score: 650,
        ),
        CreditScore(
          changeSinceLast: 33,
          lastUpdate: DateTime(2023, 10, 12),
          nextUpdate: DateTime(2023, 11, 12),
          quality: 'Good',
          score: 668,
        ),
        CreditScore(
          changeSinceLast: -16,
          lastUpdate: DateTime(2023, 9, 12),
          nextUpdate: DateTime(2023, 10, 12),
          quality: 'Better',
          score: 635,
        ),
        CreditScore(
          changeSinceLast: 27,
          lastUpdate: DateTime(2023, 8, 12),
          nextUpdate: DateTime(2023, 9, 12),
          quality: 'Better',
          score: 651,
        ),
        CreditScore(
          changeSinceLast: 24,
          lastUpdate: DateTime(2023, 7, 12),
          nextUpdate: DateTime(2023, 8, 12),
          quality: 'Better',
          score: 624,
        ),
        CreditScore(
          changeSinceLast: -6,
          lastUpdate: DateTime(2023, 6, 12),
          nextUpdate: DateTime(2023, 7, 12),
          quality: 'Better',
          score: 600,
        ),
        CreditScore(
          changeSinceLast: 8,
          lastUpdate: DateTime(2023, 5, 12),
          nextUpdate: DateTime(2023, 6, 12),
          quality: 'Better',
          score: 606,
        ),
      ],
    );
  }
}
