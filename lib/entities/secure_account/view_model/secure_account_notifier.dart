import 'dart:async';

import 'package:ava_flutter/entities/secure_account/model/secure_account.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecureAccountAsyncNotifier extends AsyncNotifier<SecureAccount> {
  static final provider =
      AsyncNotifierProvider<SecureAccountAsyncNotifier, SecureAccount>(
    SecureAccountAsyncNotifier.new,
  );

  @override
  FutureOr<SecureAccount> build() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return const SecureAccount(
      balance: 30.0,
      creditLimit: 600.0,
      quality: 'Excellent',
      spendLimit: 100.0,
      totalBalance: 8390.0,
      totalLimit: 200900.0,
      utilization: 0.04,
    );
  }
}
