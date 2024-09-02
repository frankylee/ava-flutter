enum PayFrequency {
  weekly('Weekly'),
  biWeekly('Bi-weekly'),
  monthly('Monthly');

  const PayFrequency(this.value);

  final String value;

  static PayFrequency? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    switch (value) {
      case 'Bi-weekly':
        return PayFrequency.biWeekly;
      case 'Weekly':
        return PayFrequency.weekly;
      case 'Monthly':
      default:
        return PayFrequency.monthly;
    }
  }
}
