import 'package:ava_flutter/app/router/app_routes.dart';
import 'package:ava_flutter/features/give_feedback/view_model/show_give_feedback_provider.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.goNamed(AppRoute.home.name),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.confirmYourEmployment,
                style:
                    context.textTheme.displayMedium?.copyWith(fontSize: 40.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                context.l10n.reviewAndConfirmEmploymentDetailsSubtitle,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colors.outline),
              ),
              const SizedBox(height: 48.0),
              if (!_isEditMode)
                OutlinedButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() => _isEditMode = true);
                  },
                  child: Text(
                    context.l10n.edit,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  ref.read(showGiveFeedbackProvider.notifier).state = true;
                  context.goNamed(AppRoute.home.name);
                },
                child: Text(
                  context.l10n.confirm,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
