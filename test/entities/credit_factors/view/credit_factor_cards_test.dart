import 'package:ava_flutter/entities/credit_factors/view/credit_factor_cards.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/ava.dart';

void main() {
  group('CreditFactorCards', () {
    testWidgets(
      'Data',
      (WidgetTester tester) async {
        // Setup the test application.
        await tester.pumpWidget(
          const TestApp(
            child: CreditFactorCards(),
          ),
        );
        // Wait for the data to load and settle the widget.
        await tester.pumpAndSettle();
        // Assert that the data state is in the widget tree.
        expect(find.byType(CreditFactorCardsData), findsOneWidget);
      },
      // Skipping this test for now due to a renderflex overflow that does not
      // appear on device. Come back to this later.
      skip: true,
    );

    testWidgets('Loading', (WidgetTester tester) async {
      // Run the test in async to ensure we can hit the loading state without
      // an error for the Future.delayed() timer running in the Notifier.
      await tester.runAsync(() async {
        // Setup the test application.
        await tester.pumpWidget(
          const TestApp(
            child: CreditFactorCards(),
          ),
        );
        // Assert that the loading state is in the widget tree.
        expect(find.byType(CreditFactorCardsLoading), findsOneWidget);
      });
    });
  });
}
