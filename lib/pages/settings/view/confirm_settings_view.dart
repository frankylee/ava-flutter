import 'package:ava_flutter/app/router/app_routes.dart';
import 'package:ava_flutter/entities/employment/model/employment.dart';
import 'package:ava_flutter/features/give_feedback/view_model/show_give_feedback_provider.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/button/primary_filled_button.dart';
import 'package:ava_flutter/shared/ui/button/secondary_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ConfirmSettingsView extends ConsumerWidget {
  const ConfirmSettingsView({
    super.key,
    required this.employment,
    required this.onEditPressed,
  });

  final Employment employment;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.confirmYourEmployment,
          style: context.textTheme.displayMedium?.copyWith(fontSize: 40.0),
        ),
        const SizedBox(height: 4.0),
        Text(
          context.l10n.reviewAndConfirmEmploymentDetailsSubtitle,
          style: context.textTheme.bodyLarge
              ?.copyWith(color: context.colors.outline),
        ),
        const SizedBox(height: 16.0),
        _DisabledFormField(
          label: context.l10n.employmentType,
          value: employment.employmentType.value,
        ),
        _DisabledFormField(
          label: context.l10n.employer,
          value: employment.employer,
        ),
        _DisabledFormField(
          label: context.l10n.jobTitle,
          value: employment.jobTitle,
        ),
        _DisabledFormField(
          label: context.l10n.grossAnnualIncomeLabel,
          value: context.l10n.grossAnnualIncome(employment.grossAnnual),
        ),
        _DisabledFormField(
          label: context.l10n.payFrequency,
          value: employment.payFrequency.value,
        ),
        _DisabledFormField(
          label: context.l10n.employerAddress,
          value: employment.employerAddress,
        ),
        _DisabledFormField(
          label: context.l10n.timeWithEmployer,
          value:
              '${employment.employmentDurationYear.value} ${employment.employmentDurationMonth.value}',
        ),
        _DisabledFormField(
          label: context.l10n.myNextPaydayIs,
          value:
              DateFormat('MMM d, yyyy (EEEE)').format(employment.nextPayDate),
        ),
        _DisabledFormField(
          label: context.l10n.isYourPayDirectDeposit,
          value:
              employment.isDirectDeposit ? context.l10n.yes : context.l10n.no,
        ),
        const SizedBox(height: 32.0),
        SecondaryOutlinedButton(
          label: context.l10n.edit,
          onPressed: onEditPressed,
        ),
        const SizedBox(height: 4.0),
        PrimaryFilledButton(
          label: context.l10n.confirm,
          onPressed: () {
            ref.read(showGiveFeedbackProvider.notifier).state = true;
            context.goNamed(AppRoute.home.name);
          },
        ),
        const SizedBox(height: 100.0),
      ],
    );
  }
}

class _DisabledFormField extends StatelessWidget {
  const _DisabledFormField({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textTheme.bodySmall
                ?.copyWith(color: context.colors.outline),
          ),
          const SizedBox(height: 4.0),
          Flexible(
            child: Text(
              value,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
