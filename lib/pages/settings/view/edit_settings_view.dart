import 'package:ava_flutter/entities/employment/model/employment.dart';
import 'package:ava_flutter/entities/employment/model/employment_duration_month.enum.dart';
import 'package:ava_flutter/entities/employment/model/employment_duration_year.enum.dart';
import 'package:ava_flutter/entities/employment/model/employment_type.enum.dart';
import 'package:ava_flutter/entities/employment/model/pay_frequency.enum.dart';
import 'package:ava_flutter/entities/employment/view_model/employment_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/button/primary_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EditSettingsView extends ConsumerStatefulWidget {
  const EditSettingsView({
    super.key,
    required this.employment,
    required this.onContinuePressed,
  });

  final Employment employment;
  final VoidCallback onContinuePressed;

  @override
  ConsumerState<EditSettingsView> createState() => _EditSettingsViewState();
}

class _EditSettingsViewState extends ConsumerState<EditSettingsView> {
  final _dateFormatter = DateFormat('MMM d, yyyy (EEEE)');
  final _formKey = GlobalKey<FormState>();

  final _durationMonthController = TextEditingController();
  final _durationYearController = TextEditingController();
  final _employerController = TextEditingController();
  final _employerAddressController = TextEditingController();
  final _employmentTypeController = TextEditingController();
  final _grossAnnualController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _nextPaydayController = TextEditingController();
  final _payFrequencyController = TextEditingController();

  late bool _isDirectDeposit = widget.employment.isDirectDeposit;
  late DateTime _nextPayDate = widget.employment.nextPayDate;

  @override
  void initState() {
    super.initState();
    _durationMonthController.text =
        widget.employment.employmentDurationMonth.value;
    _durationYearController.text =
        widget.employment.employmentDurationYear.value;
    _employerController.text = widget.employment.employer;
    _employerAddressController.text = widget.employment.employerAddress;
    _employmentTypeController.text = widget.employment.employmentType.value;
    _grossAnnualController.text = widget.employment.grossAnnual.toString();
    _jobTitleController.text = widget.employment.jobTitle;
    _nextPaydayController.text =
        _dateFormatter.format(widget.employment.nextPayDate);
    _payFrequencyController.text = widget.employment.payFrequency.value;
  }

  @override
  void dispose() {
    _durationMonthController.dispose();
    _durationYearController.dispose();
    _employerController.dispose();
    _employerAddressController.dispose();
    _employmentTypeController.dispose();
    _grossAnnualController.dispose();
    _jobTitleController.dispose();
    _nextPaydayController.dispose();
    _payFrequencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.editEmploymentInfo,
          style: context.textTheme.displayMedium?.copyWith(fontSize: 40.0),
        ),
        const SizedBox(height: 16.0),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FormFieldLabel(label: context.l10n.employmentType),
              DropdownMenu(
                controller: _employmentTypeController,
                dropdownMenuEntries: List.generate(
                  EmploymentType.values.length,
                  (index) => DropdownMenuEntry(
                    value: EmploymentType.values.elementAt(index),
                    label: EmploymentType.values.elementAt(index).value,
                  ),
                ),
                width: double.maxFinite,
              ),
              _FormFieldLabel(label: context.l10n.employer),
              TextFormField(
                controller: _employerController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.validateEmployer;
                  }
                  return null;
                },
              ),
              _FormFieldLabel(label: context.l10n.jobTitle),
              TextFormField(
                controller: _jobTitleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.validateJobTitle;
                  }
                  return null;
                },
              ),
              _FormFieldLabel(label: context.l10n.grossAnnualIncomeLabel),
              TextFormField(
                controller: _grossAnnualController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.validateGrossAnnual;
                  }
                  return null;
                },
              ),
              _FormFieldLabel(label: context.l10n.payFrequency),
              DropdownMenu(
                controller: _payFrequencyController,
                dropdownMenuEntries: List.generate(
                  PayFrequency.values.length,
                  (index) => DropdownMenuEntry(
                    value: PayFrequency.values.elementAt(index),
                    label: PayFrequency.values.elementAt(index).value,
                  ),
                ),
                width: double.maxFinite,
              ),
              _FormFieldLabel(label: context.l10n.myNextPaydayIs),
              TextFormField(
                controller: _nextPaydayController,
                decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () async {
                      final today = DateTime.now();
                      final nextPayDate = await showDatePicker(
                        context: context,
                        firstDate: today,
                        lastDate:
                            DateTime(today.year + 1, today.month, today.day),
                      );
                      if (nextPayDate != null) {
                        _nextPaydayController.text =
                            _dateFormatter.format(nextPayDate);
                        _nextPayDate = nextPayDate;
                      }
                    },
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: context.colors.outline,
                      size: 20.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.validateNextPayDate;
                  }
                  return null;
                },
              ),
              _FormFieldLabel(label: context.l10n.isYourPayDirectDeposit),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.25,
                    child: Radio<bool>(
                      value: true,
                      groupValue: _isDirectDeposit,
                      onChanged: (value) =>
                          setState(() => _isDirectDeposit = value ?? false),
                    ),
                  ),
                  Text(context.l10n.yes, style: context.textTheme.bodyLarge),
                  const SizedBox(width: 48.0),
                  Transform.scale(
                    scale: 1.25,
                    child: Radio<bool>(
                      value: false,
                      groupValue: _isDirectDeposit,
                      onChanged: (value) =>
                          setState(() => _isDirectDeposit = value ?? false),
                    ),
                  ),
                  Text(context.l10n.no, style: context.textTheme.bodyLarge),
                ],
              ),
              _FormFieldLabel(label: context.l10n.employerAddress),
              TextFormField(
                controller: _employerAddressController,
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.validateEmployerAddress;
                  }
                  return null;
                },
              ),
              _FormFieldLabel(label: context.l10n.timeWithEmployer),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownMenu(
                    controller: _durationYearController,
                    dropdownMenuEntries: List.generate(
                      EmploymentDurationYear.values.length,
                      (index) => DropdownMenuEntry(
                        value: EmploymentDurationYear.values.elementAt(index),
                        label: EmploymentDurationYear.values
                            .elementAt(index)
                            .value,
                      ),
                    ),
                    width: MediaQuery.sizeOf(context).width / 2.3,
                  ),
                  DropdownMenu(
                    controller: _durationMonthController,
                    dropdownMenuEntries: List.generate(
                      EmploymentDurationMonth.values.length,
                      (index) => DropdownMenuEntry(
                        value: EmploymentDurationMonth.values.elementAt(index),
                        label: EmploymentDurationMonth.values
                            .elementAt(index)
                            .value,
                      ),
                    ),
                    width: MediaQuery.sizeOf(context).width / 2.3,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 100.0),
        PrimaryFilledButton(
          label: context.l10n.continueLabel,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ref.read(EmploymentNotifier.provider.notifier).updateEmployment(
                    employer: _employerController.text,
                    employerAddress: _employerAddressController.text,
                    employmentDurationMonth: _durationMonthController.text,
                    employmentDurationYear: _durationYearController.text,
                    employmentType: _employmentTypeController.text,
                    grossAnnual: int.tryParse(_grossAnnualController.text),
                    isDirectDeposit: _isDirectDeposit,
                    jobTitle: _jobTitleController.text,
                    nextPayDate: _nextPayDate,
                    payFrequency: _payFrequencyController.text,
                  );
              widget.onContinuePressed.call();
            }
          },
        ),
        const SizedBox(height: 48.0),
      ],
    );
  }
}

class _FormFieldLabel extends StatelessWidget {
  const _FormFieldLabel({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
      child: Text(
        label,
        style: context.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
