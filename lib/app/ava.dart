import 'package:ava_flutter/app/router/app_router.dart';
import 'package:ava_flutter/app/theme/text_theme.dart';
import 'package:ava_flutter/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ava_l10n.dart';

class Ava extends StatelessWidget {
  const Ava({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme(createTextTheme(context));

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Ava',
      theme: theme.light(),
      locale: const Locale('en'),
      localizationsDelegates: AvaL10n.localizationsDelegates,
      supportedLocales: AvaL10n.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
