import 'package:ava_flutter/app/router/app_router.dart';
import 'package:ava_flutter/app/theme/text_theme.dart';
import 'package:ava_flutter/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/ava_l10n.dart';

class Ava extends StatelessWidget {
  const Ava({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context);
    AppTheme theme = AppTheme(textTheme);

    return MaterialApp.router(
      title: 'Flutter Demo',
      darkTheme: theme.dark(),
      theme: theme.light(),
      locale: const Locale('en'),
      localizationsDelegates: AvaL10n.localizationsDelegates,
      supportedLocales: AvaL10n.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
