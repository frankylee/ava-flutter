enum EmploymentDurationYear {
  year0('0 years'),
  year1('1 year'),
  year2('2 years'),
  year3('3 years'),
  year4('4 years'),
  year5Plus('5+ years');

  const EmploymentDurationYear(this.value);

  final String value;

  static EmploymentDurationYear? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    switch (value) {
      case '1 year':
        return EmploymentDurationYear.year1;
      case '2 years':
        return EmploymentDurationYear.year2;
      case '3 years':
        return EmploymentDurationYear.year3;
      case '4 years':
        return EmploymentDurationYear.year4;
      case '5 years':
        return EmploymentDurationYear.year5Plus;
      case '0 years':
      default:
        return EmploymentDurationYear.year0;
    }
  }
}
