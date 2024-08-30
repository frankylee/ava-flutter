import 'package:ava_flutter/entities/credit_score/model/credit_score.dart';
import 'package:equatable/equatable.dart';

class CreditScoreHistory implements Equatable {
  const CreditScoreHistory({
    required this.calculatedBy,
    required this.history,
    required this.reportingAgency,
  });

  final String calculatedBy;
  final List<CreditScore> history;
  final String reportingAgency;

  @override
  List<Object?> get props => [
        calculatedBy,
        history,
        reportingAgency,
      ];

  @override
  bool get stringify => true;
}
