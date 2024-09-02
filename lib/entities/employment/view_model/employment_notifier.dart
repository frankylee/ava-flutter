import 'package:ava_flutter/entities/employment/model/employment.dart';
import 'package:ava_flutter/entities/employment/model/employment_duration_month.enum.dart';
import 'package:ava_flutter/entities/employment/model/employment_duration_year.enum.dart';
import 'package:ava_flutter/entities/employment/model/employment_type.enum.dart';
import 'package:ava_flutter/entities/employment/model/pay_frequency.enum.dart';
import 'package:ava_flutter/shared/local_storage/view_model/local_storage_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmploymentNotifier extends Notifier<Employment> {
  static final provider = NotifierProvider<EmploymentNotifier, Employment>(
    EmploymentNotifier.new,
  );

  @override
  Employment build() {
    return _getFromLocalStorage();
  }

  /// Provide new values for the employment record so it may be persisted to the
  /// local storage. If the local storage is updated successfully, then all
  /// values in the cached local state will be updated.
  void updateEmployment({
    String? employer,
    String? employerAddress,
    String? employmentDurationMonth,
    String? employmentDurationYear,
    String? employmentType,
    int? grossAnnual,
    bool? isDirectDeposit,
    String? jobTitle,
    DateTime? nextPayDate,
    String? payFrequency,
  }) {
    final localStorageNotifier =
        ref.read(LocalStorageNotifier.provider.notifier);
    localStorageNotifier.updateEmployer(employer: employer);
    localStorageNotifier.updateEmployerAddress(
      employerAddress: employerAddress,
    );
    localStorageNotifier.updateEmploymentDurationMonth(
      month: employmentDurationMonth,
    );
    localStorageNotifier.updateEmploymentDurationYear(
      year: employmentDurationYear,
    );
    localStorageNotifier.updateEmploymentType(
      employmentType: employmentType,
    );
    localStorageNotifier.updateGrossAnnual(grossAnnual: grossAnnual);
    localStorageNotifier.updateIsDirectDeposit(
      isDirectDeposit: isDirectDeposit,
    );
    localStorageNotifier.updateJobTitle(jobTitle: jobTitle);
    localStorageNotifier.updateNextPayDate(
      nextPayDate: nextPayDate?.toIso8601String(),
    );
    localStorageNotifier.updatePayFrequency(payFrequency: payFrequency);
    // Refresh the local cached state by invalidating self, causing a rebuild.
    ref.invalidateSelf();
  }

  /// Retrieve the data from local storage and set to default values if not present.
  Employment _getFromLocalStorage() {
    final localStorageNotifier =
        ref.read(LocalStorageNotifier.provider.notifier);
    return Employment(
      employer: localStorageNotifier.getEmployer() ?? 'Apple Inc.',
      employerAddress: localStorageNotifier.getEmployerAddress() ??
          'Apple One Apple Park Way, Cupertino, CA 95014',
      employmentDurationMonth: EmploymentDurationMonth.tryParse(
            localStorageNotifier.getEmploymentDurationMonth(),
          ) ??
          EmploymentDurationMonth.month3,
      employmentDurationYear: EmploymentDurationYear.tryParse(
            localStorageNotifier.getEmploymentDurationYear(),
          ) ??
          EmploymentDurationYear.year1,
      employmentType:
          EmploymentType.tryParse(localStorageNotifier.getEmploymentType()) ??
              EmploymentType.fullTime,
      grossAnnual: localStorageNotifier.getGrossAnnual() ?? 150000,
      isDirectDeposit: localStorageNotifier.getIsDirectDeposit() ?? true,
      jobTitle: localStorageNotifier.getJobTitle() ?? 'Software Engineer',
      nextPayDate:
          DateTime.tryParse(localStorageNotifier.getNextPayDate() ?? '') ??
              DateTime(2023, 9, 23),
      payFrequency:
          PayFrequency.tryParse(localStorageNotifier.getPayFrequency()) ??
              PayFrequency.biWeekly,
    );
  }
}
