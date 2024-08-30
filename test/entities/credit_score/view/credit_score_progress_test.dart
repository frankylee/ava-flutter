import 'package:ava_flutter/entities/credit_score/view/credit_score_progress.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/ava.dart';

void main() {
  group('CreditScoreProgress', () {
    testWidgets('Data', (WidgetTester tester) async {
      // Setup the test application.
      await tester.pumpWidget(
        const TestApp(
          child: CreditScoreProgress(),
        ),
      );
      // Wait for the data to load and settle the widget.
      await tester.pumpAndSettle();
      // Assert that the data state is in the widget tree.
      expect(find.byType(CreditScoreProgressData), findsOneWidget);
    });

    testWidgets('Loading', (WidgetTester tester) async {
      // Run the test in async to ensure we can hit the loading state without
      // an error for the Future.delayed() timer running in the Notifier.
      await tester.runAsync(() async {
        // Setup the test application.
        await tester.pumpWidget(
          const TestApp(
            child: CreditScoreProgress(),
          ),
        );
        // Assert that the loading state is in the widget tree.
        expect(find.byType(CreditScoreProgressLoading), findsOneWidget);
      });
    });
  });
}
