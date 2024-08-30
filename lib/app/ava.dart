import 'package:ava_flutter/app/theme/text_theme.dart';
import 'package:ava_flutter/app/theme/theme.dart';
import 'package:ava_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Ava extends StatelessWidget {
  const Ava({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context);
    AppTheme theme = AppTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: theme.dark(),
      theme: theme.light(),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
