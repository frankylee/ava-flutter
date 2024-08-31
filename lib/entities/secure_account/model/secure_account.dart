import 'package:equatable/equatable.dart';

class SecureAccount implements Equatable {
  const SecureAccount({
    required this.balance,
    required this.creditLimit,
    required this.spendLimit,
    required this.totalBalance,
    required this.totalLimit,
    required this.utilization,
  });

  final double balance;
  final double creditLimit;
  final double spendLimit;
  final double totalBalance;
  final double totalLimit;
  final double utilization;

  @override
  List<Object?> get props => [
        balance,
        creditLimit,
        spendLimit,
        totalBalance,
        totalLimit,
        utilization,
      ];

  @override
  bool get stringify => true;
}
