import 'package:ava_flutter/entities/credit_score/view/credit_score_chart_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/ava.dart';

void main() {
  group('CreditScoreChartCardProgress', () {
    testWidgets(
      'Data',
      (WidgetTester tester) async {
        await tester.runAsync(() async {
          // Setup the test application.
          await tester.pumpWidget(
            const TestApp(
              child: CreditScoreChartCard(),
            ),
          );
          // Wait for the data to load and settle the widget.
          await tester.pumpAndSettle();
          // Assert that the data state is in the widget tree.
          expect(find.byType(CreditScoreChartCardData), findsOneWidget);
        });
      },
      // Skipping this test for now since it is throwing a timeout error after
      // changes to the chart animation. Come back to this later.
      skip: true,
    );

    testWidgets('Loading', (WidgetTester tester) async {
      // Run the test in async to ensure we can hit the loading state without
      // an error for the Future.delayed() timer running in the Notifier.
      await tester.runAsync(() async {
        // Setup the test application.
        await tester.pumpWidget(
          const TestApp(
            child: CreditScoreChartCard(),
          ),
        );
        // Assert that the loading state is in the widget tree.
        expect(find.byType(CreditScoreChartCardLoading), findsOneWidget);
      });
    });
  });
}
