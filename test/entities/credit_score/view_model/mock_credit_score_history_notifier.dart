import 'dart:async';

import 'package:ava_flutter/entities/credit_score/model/credit_score.dart';
import 'package:ava_flutter/entities/credit_score/model/credit_score_history.dart';
import 'package:ava_flutter/entities/credit_score/view_model/credit_score_history_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';

class MockCreditScoreHistoryAsyncNotifier
    extends AsyncNotifier<CreditScoreHistory>
    with Mock
    implements CreditScoreHistoryAsyncNotifier {
  MockCreditScoreHistoryAsyncNotifier({
    this.lastUpdate,
  });

  final DateTime? lastUpdate;

  @override
  FutureOr<CreditScoreHistory> build() {
    return CreditScoreHistory(
      calculatedBy: 'VantageScore 3.0',
      reportingAgency: 'Experian',
      history: [
        CreditScore(
          changeSinceLast: 2,
          lastUpdate: lastUpdate ?? DateTime.now(),
          nextUpdate: DateTime(2024, 5, 12),
          quality: 'Good',
          score: 720,
        ),
      ],
    );
  }
}
