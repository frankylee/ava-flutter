import 'package:equatable/equatable.dart';

class CreditCard implements Equatable {
  const CreditCard({
    required this.balance,
    required this.creditLimit,
    required this.lastReportedOn,
    required this.name,
    required this.utilization,
  });

  final double balance;
  final double creditLimit;
  final DateTime lastReportedOn;
  final String name;
  final double utilization;

  @override
  List<Object?> get props => [
        balance,
        creditLimit,
        lastReportedOn,
        name,
        utilization,
      ];

  @override
  bool get stringify => true;
}
