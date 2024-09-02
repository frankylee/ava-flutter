enum EmploymentType {
  contract('Contract'),
  freelance('Freelance'),
  fullTime('Full-time'),
  partTime('Part-time');

  const EmploymentType(this.value);

  final String value;

  static EmploymentType? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    switch (value) {
      case 'Contract':
        return EmploymentType.contract;
      case 'Freelance':
        return EmploymentType.freelance;
      case 'Full-time':
        return EmploymentType.fullTime;
      case 'Part-time':
      default:
        return EmploymentType.partTime;
    }
  }
}
