import 'dart:async';

import 'package:ava_flutter/entities/credit_card/model/credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditCardAsyncNotifier extends AsyncNotifier<List<CreditCard>> {
  static final provider =
      AsyncNotifierProvider<CreditCardAsyncNotifier, List<CreditCard>>(
    CreditCardAsyncNotifier.new,
  );

  @override
  FutureOr<List<CreditCard>> build() async {
    await Future.delayed(const Duration(milliseconds: 2250));
    return [
      CreditCard(
        balance: 1500.0,
        creditLimit: 6300.0,
        lastReportedOn: DateTime(2023, 6, 20),
        name: 'Syncb/Amazon',
        utilization: 0.21,
      ),
      CreditCard(
        balance: 1500.0,
        creditLimit: 6300.0,
        lastReportedOn: DateTime(2023, 6, 20),
        name: 'Syncb/Amazon',
        utilization: 0.21,
      ),
      CreditCard(
        balance: 1500.0,
        creditLimit: 6300.0,
        lastReportedOn: DateTime(2023, 6, 20),
        name: 'Syncb/Amazon',
        utilization: 0.21,
      ),
    ];
  }
}
