import 'package:ava_flutter/entities/employment/model/employment_duration_month.enum.dart';
import 'package:ava_flutter/entities/employment/model/employment_duration_year.enum.dart';
import 'package:ava_flutter/entities/employment/model/employment_type.enum.dart';
import 'package:ava_flutter/entities/employment/model/pay_frequency.enum.dart';
import 'package:equatable/equatable.dart';

class Employment implements Equatable {
  const Employment({
    required this.employer,
    required this.employerAddress,
    required this.employmentDurationMonth,
    required this.employmentDurationYear,
    required this.employmentType,
    required this.grossAnnual,
    required this.isDirectDeposit,
    required this.jobTitle,
    required this.nextPayDate,
    required this.payFrequency,
  });

  final String employer;
  final String employerAddress;
  final EmploymentDurationMonth employmentDurationMonth;
  final EmploymentDurationYear employmentDurationYear;
  final EmploymentType employmentType;
  final int grossAnnual;
  final bool isDirectDeposit;
  final String jobTitle;
  final DateTime nextPayDate;
  final PayFrequency payFrequency;

  @override
  List<Object?> get props => [
        employer,
        employerAddress,
        employmentDurationMonth,
        employmentDurationYear,
        employmentType,
        grossAnnual,
        isDirectDeposit,
        jobTitle,
        nextPayDate,
        payFrequency,
      ];

  @override
  bool get stringify => true;

  Employment copyWith({
    String? employer,
    String? employerAddress,
    EmploymentDurationMonth? employmentDurationMonth,
    EmploymentDurationYear? employmentDurationYear,
    EmploymentType? employmentType,
    int? grossAnnual,
    bool? isDirectDeposit,
    String? jobTitle,
    DateTime? nextPayDate,
    PayFrequency? payFrequency,
  }) {
    return Employment(
      employer: employer ?? this.employer,
      employerAddress: employerAddress ?? this.employerAddress,
      employmentDurationMonth:
          employmentDurationMonth ?? this.employmentDurationMonth,
      employmentDurationYear:
          employmentDurationYear ?? this.employmentDurationYear,
      employmentType: employmentType ?? this.employmentType,
      grossAnnual: grossAnnual ?? this.grossAnnual,
      isDirectDeposit: isDirectDeposit ?? this.isDirectDeposit,
      jobTitle: jobTitle ?? this.jobTitle,
      nextPayDate: nextPayDate ?? this.nextPayDate,
      payFrequency: payFrequency ?? this.payFrequency,
    );
  }
}
