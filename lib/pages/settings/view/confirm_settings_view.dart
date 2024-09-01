import 'package:ava_flutter/app/router/app_routes.dart';
import 'package:ava_flutter/features/give_feedback/view_model/show_give_feedback_provider.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/button/primary_filled_button.dart';
import 'package:ava_flutter/shared/ui/button/secondary_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConfirmSettingsView extends ConsumerStatefulWidget {
  const ConfirmSettingsView({
    super.key,
    required this.onEditPressed,
  });

  final VoidCallback onEditPressed;

  @override
  ConsumerState<ConfirmSettingsView> createState() =>
      _ConfirmSettingsViewState();
}

class _ConfirmSettingsViewState extends ConsumerState<ConfirmSettingsView> {
  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 48.0),
        SecondaryOutlinedButton(
          label: context.l10n.edit,
          onPressed: widget.onEditPressed,
        ),
        const SizedBox(height: 4.0),
        PrimaryFilledButton(
          label: context.l10n.confirm,
          onPressed: () {
            ref.read(showGiveFeedbackProvider.notifier).state = true;
            context.goNamed(AppRoute.home.name);
          },
        ),
      ],
    );
  }
}
