import 'package:ava_flutter/entities/credit_score/view_model/credit_score_history_notifier.dart';
import 'package:ava_flutter/entities/credit_score/view_model/credit_score_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/provider_container.dart';
import 'mock_credit_score_history_notifier.dart';

void main() {
  group('CreditScoreAsyncNotifier', () {
    group('isLastUpdateToday()', () {
      test(
        'returns true if last update is today',
        () {
          // Setup the container with the default values, which will be today.
          final container = createContainer(
            overrides: [
              CreditScoreHistoryAsyncNotifier.provider
                  .overrideWith(MockCreditScoreHistoryAsyncNotifier.new),
            ],
          );
          // Determine the result by calling the notifier method.
          final result = container
              .read(CreditScoreAsyncNotifier.provider.notifier)
              .isLastUpdateToday();
          // Assert that the value is true.
          expect(result, true);
        },
        // Skipping this test for now until we replace DateTime with Clock
        // package to facilitate testing.
        skip: true,
      );

      test('returns false if last update is not today', () {
        // Setup the container with a date from the past.
        final container = createContainer(
          overrides: [
            CreditScoreHistoryAsyncNotifier.provider.overrideWith(
              () => MockCreditScoreHistoryAsyncNotifier(
                lastUpdate: DateTime(2024, 1, 13),
              ),
            ),
          ],
        );
        // Determine the result by calling the notifier method.
        final result = container
            .read(CreditScoreAsyncNotifier.provider.notifier)
            .isLastUpdateToday();
        // Assert that the value is false.
        expect(result, false);
      });
    });
  });
}
