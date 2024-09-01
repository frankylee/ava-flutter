/// When a new [LocalStorageKey] is created, it must be added to the `allotList`
/// in `main.dart` in order to be used.
///
/// We will follow the format `ava.kabob-case.key`.
enum LocalStorageKey {
  employer('ava.employer.key'),
  employerAddress('ava.employer-address.key'),
  employmentDurationMonth('ava.employment-duration-month.key'),
  employmentDurationYear('ava.employment-duration-year.key'),
  employmentType('ava.employment-type.key'),
  grossAnnual('ava.gross-annual.key'),
  isDirectDeposit('ava.is-direct-deposit.key'),
  jobTitle('ava.job-title.key'),
  nextPayDate('ava.next-pay-date.key'),
  payFrequency('ava.pay-frequency.key');

  const LocalStorageKey(this.value);

  final String value;
}
