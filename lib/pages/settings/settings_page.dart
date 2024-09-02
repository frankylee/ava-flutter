import 'package:ava_flutter/app/router/app_routes.dart';
import 'package:ava_flutter/entities/employment/view_model/employment_notifier.dart';
import 'package:ava_flutter/pages/settings/view/confirm_settings_view.dart';
import 'package:ava_flutter/pages/settings/view/edit_settings_view.dart';
import 'package:flutter/material.dart';
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
    final employment = ref.watch(EmploymentNotifier.provider);
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
          child: SingleChildScrollView(
            child: _isEditMode
                ? EditSettingsView(
                    employment: employment,
                    onContinuePressed: () =>
                        setState(() => _isEditMode = !_isEditMode),
                  )
                : ConfirmSettingsView(
                    employment: employment,
                    onEditPressed: () =>
                        setState(() => _isEditMode = !_isEditMode),
                  ),
          ),
        ),
      ),
    );
  }
}
