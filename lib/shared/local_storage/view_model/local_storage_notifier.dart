import 'package:ava_flutter/shared/local_storage/model/local_storage_key.enum.dart';
import 'package:ava_flutter/shared/local_storage/view_model/shared_preferences_provider.dart';
import 'package:ava_flutter/shared/mixin/logger_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The [LocalStorageNotifier] interacts with the [SharedPreferencesWithCache]
/// instance. This allows us to manage any data we wish to persist or remove
/// from the device.
class LocalStorageNotifier extends Notifier<void> with LoggerMixin {
  static final provider =
      NotifierProvider<LocalStorageNotifier, void>(LocalStorageNotifier.new);

  @override
  void build() {
    ref.watch(sharedPreferencesProvider);
  }

  String? getEmployer() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.employer.value);
    } catch (err, stack) {
      logger.info('Employer could not be retrieved.', err, stack);
      return null;
    }
  }

  String? getEmployerAddress() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.employerAddress.value);
    } catch (err, stack) {
      logger.info('Employer address could not be retrieved.', err, stack);
      return null;
    }
  }

  String? getEmploymentDurationMonth() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.employmentDurationMonth.value);
    } catch (err, stack) {
      logger.info(
        'Employment duration month could not be retrieved.',
        err,
        stack,
      );
      return null;
    }
  }

  String? getEmploymentDurationYear() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.employmentDurationYear.value);
    } catch (err, stack) {
      logger.info(
        'Employment duration year could not be retrieved.',
        err,
        stack,
      );
      return null;
    }
  }

  String? getEmploymentType() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.employmentType.value);
    } catch (err, stack) {
      logger.info('Employment type could not be retrieved.', err, stack);
      return null;
    }
  }

  int? getGrossAnnual() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getInt(LocalStorageKey.grossAnnual.value);
    } catch (err, stack) {
      logger.info(
        'Employment gross annual could not be retrieved.',
        err,
        stack,
      );
      return null;
    }
  }

  bool? getIsDirectDeposit() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getBool(LocalStorageKey.isDirectDeposit.value);
    } catch (err, stack) {
      logger.info(
        'Employment is direct deposit could not be retrieved.',
        err,
        stack,
      );
      return null;
    }
  }

  String? getJobTitle() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.jobTitle.value);
    } catch (err, stack) {
      logger.info('Employment job title could not be retrieved.', err, stack);
      return null;
    }
  }

  String? getNextPayDate() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.nextPayDate.value);
    } catch (err, stack) {
      logger.info(
        'Employment next pay date could not be retrieved.',
        err,
        stack,
      );
      return null;
    }
  }

  String? getPayFrequency() {
    try {
      return ref
          .read(sharedPreferencesProvider)
          .getString(LocalStorageKey.payFrequency.value);
    } catch (err, stack) {
      logger.info(
        'Employment pay frequency could not be retrieved.',
        err,
        stack,
      );
      return null;
    }
  }

  Future<void> updateEmployer({required String? employer}) async {
    try {
      if (employer != null && employer.isNotEmpty) {
        return await ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.employer.value, employer);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.employer.value);
    } catch (err, stack) {
      logger.info('Employer could not be updated.', err, stack);
    }
  }

  Future<void> updateEmployerAddress({required String? employerAddress}) async {
    try {
      if (employerAddress != null && employerAddress.isNotEmpty) {
        return ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.employerAddress.value, employerAddress);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.employerAddress.value);
    } catch (err, stack) {
      logger.info('Employer address could not be updated.', err, stack);
    }
  }

  Future<void> updateEmploymentDurationMonth({required String? month}) async {
    try {
      if (month != null && month.isNotEmpty) {
        return ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.employmentDurationMonth.value, month);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.employmentDurationMonth.value);
    } catch (err, stack) {
      logger.info(
        'Employment duration month could not be updated.',
        err,
        stack,
      );
    }
  }

  Future<void> updateEmploymentDurationYear({required String? year}) async {
    try {
      if (year != null && year.isNotEmpty) {
        return ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.employmentDurationYear.value, year);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.employmentDurationYear.value);
    } catch (err, stack) {
      logger.info(
        'Employment duration year could not be updated.',
        err,
        stack,
      );
    }
  }

  Future<void> updateEmploymentType({required String? employmentType}) async {
    try {
      if (employmentType != null && employmentType.isNotEmpty) {
        return ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.employmentType.value, employmentType);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.employmentType.value);
    } catch (err, stack) {
      logger.info('Employment type could not be updated.', err, stack);
    }
  }

  Future<void> updateGrossAnnual({required int? grossAnnual}) async {
    try {
      if (grossAnnual != null) {
        return ref
            .read(sharedPreferencesProvider)
            .setInt(LocalStorageKey.grossAnnual.value, grossAnnual);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.grossAnnual.value);
    } catch (err, stack) {
      logger.info(
        'Employment gross annual could not be updated.',
        err,
        stack,
      );
    }
  }

  Future<void> updateIsDirectDeposit({required bool? isDirectDeposit}) async {
    try {
      if (isDirectDeposit != null) {
        return ref
            .read(sharedPreferencesProvider)
            .setBool(LocalStorageKey.isDirectDeposit.value, isDirectDeposit);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.isDirectDeposit.value);
    } catch (err, stack) {
      logger.info(
        'Employment is direct deposit could not be updated.',
        err,
        stack,
      );
    }
  }

  Future<void> updateJobTitle({required String? jobTitle}) async {
    try {
      if (jobTitle != null && jobTitle.isNotEmpty) {
        return ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.jobTitle.value, jobTitle);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.jobTitle.value);
    } catch (err, stack) {
      logger.info('Employment job title could not be updated.', err, stack);
    }
  }

  Future<void> updateNextPayDate({required String? nextPayDate}) async {
    try {
      if (nextPayDate != null && nextPayDate.isNotEmpty) {
        return ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.nextPayDate.value, nextPayDate);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.nextPayDate.value);
    } catch (err, stack) {
      logger.info(
        'Employment next pay date could not be updated.',
        err,
        stack,
      );
    }
  }

  Future<void> updatePayFrequency({required String? payFrequency}) async {
    try {
      if (payFrequency != null && payFrequency.isNotEmpty) {
        return ref
            .read(sharedPreferencesProvider)
            .setString(LocalStorageKey.payFrequency.value, payFrequency);
      }
      return await ref
          .read(sharedPreferencesProvider)
          .remove(LocalStorageKey.payFrequency.value);
    } catch (err, stack) {
      logger.info(
        'Employment pay frequency could not be updated.',
        err,
        stack,
      );
    }
  }
}
