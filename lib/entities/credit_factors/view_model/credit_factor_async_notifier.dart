import 'dart:async';

import 'package:ava_flutter/entities/credit_factors/model/credit_factor.dart';
import 'package:ava_flutter/entities/credit_factors/model/credit_factor_impact.enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditFactorAsyncNotifier extends AsyncNotifier<List<CreditFactor>> {
  static final provider =
      AsyncNotifierProvider<CreditFactorAsyncNotifier, List<CreditFactor>>(
    CreditFactorAsyncNotifier.new,
  );

  @override
  FutureOr<List<CreditFactor>> build() async {
    await Future.delayed(const Duration(milliseconds: 1750));
    return const [
      CreditFactor(
        impact: CreditFactorImpact.high,
        percentage: 100,
        title: 'Payment History',
      ),
      CreditFactor(
        impact: CreditFactorImpact.low,
        percentage: 4,
        title: 'Credit Card Utilization',
      ),
      CreditFactor(
        impact: CreditFactorImpact.med,
        percentage: 2,
        title: 'Derogatory Marks',
      ),
    ];
  }
}
