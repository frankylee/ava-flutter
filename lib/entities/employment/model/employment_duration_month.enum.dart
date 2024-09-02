enum EmploymentDurationMonth {
  month0('0 months'),
  month1('1 month'),
  month2('2 months'),
  month3('3 months'),
  month4('4 months'),
  month5('5 months'),
  month6('6 months'),
  month7('7 months'),
  month8('8 months'),
  month9('9 months'),
  month10('10 months'),
  month11('11 months');

  const EmploymentDurationMonth(this.value);

  final String value;

  static EmploymentDurationMonth? tryParse(String? value) {
    if (value == null || value.isEmpty) return null;
    switch (value) {
      case '1 month':
        return EmploymentDurationMonth.month1;
      case '2 months':
        return EmploymentDurationMonth.month2;
      case '3 months':
        return EmploymentDurationMonth.month3;
      case '4 months':
        return EmploymentDurationMonth.month4;
      case '5 months':
        return EmploymentDurationMonth.month5;
      case '6 months':
        return EmploymentDurationMonth.month6;
      case '7 months':
        return EmploymentDurationMonth.month7;
      case '8 months':
        return EmploymentDurationMonth.month8;
      case '9 months':
        return EmploymentDurationMonth.month9;
      case '10 months':
        return EmploymentDurationMonth.month10;
      case '11 months':
        return EmploymentDurationMonth.month11;
      case '0 months':
      default:
        return EmploymentDurationMonth.month0;
    }
  }
}
