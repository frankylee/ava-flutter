import 'package:ava_flutter/entities/credit_factors/view/credit_factor_cards.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_chart_card.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_hero_card.dart';
import 'package:ava_flutter/entities/secure_account/view/secure_account_details.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/ava_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AvaAppBar(
        leading: const Icon(Icons.settings_outlined),
        title: context.l10n.home,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100.0),
          child: Column(
            children: [
              CreditScoreHeroCard(),
              SizedBox(height: 32.0),
              CreditScoreChartCard(),
              SizedBox(height: 32.0),
              CreditFactorCards(),
              SizedBox(height: 32.0),
              SecureAccountDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
