import 'package:ava_flutter/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ava_l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    super.key,
    required this.child,
    this.overrides = const [],
  });

  final Widget child;
  final List<Override> overrides;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        home: child,
        locale: const Locale('en'),
        localizationsDelegates: AvaL10n.localizationsDelegates,
        supportedLocales: AvaL10n.supportedLocales,
        theme: const AppTheme(TextTheme()).light(),
      ),
    );
  }
}
