import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/button/primary_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditSettingsView extends ConsumerStatefulWidget {
  const EditSettingsView({
    super.key,
    required this.onContinuePressed,
  });

  final VoidCallback onContinuePressed;

  @override
  ConsumerState<EditSettingsView> createState() => _EditSettingsViewState();
}

class _EditSettingsViewState extends ConsumerState<EditSettingsView> {
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
        PrimaryFilledButton(
          label: context.l10n.continueLabel,
          onPressed: () {
            widget.onContinuePressed.call();
          },
        ),
      ],
    );
  }
}
