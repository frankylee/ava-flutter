import 'package:ava_flutter/entities/credit_factors/model/credit_factor_impact.enum.dart';
import 'package:equatable/equatable.dart';

class CreditFactor implements Equatable {
  const CreditFactor({
    required this.impact,
    required this.percentage,
    required this.title,
  });

  final CreditFactorImpact impact;
  final double percentage;
  final String title;

  @override
  List<Object?> get props => [
        impact,
        percentage,
        title,
      ];

  @override
  bool get stringify => true;
}
