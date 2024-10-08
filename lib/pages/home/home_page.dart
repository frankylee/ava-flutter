import 'package:ava_flutter/app/router/app_routes.dart';
import 'package:ava_flutter/entities/credit_card/view/credit_accounts_card.dart';
import 'package:ava_flutter/entities/credit_factors/view/credit_factor_cards.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_chart_card.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_hero_card.dart';
import 'package:ava_flutter/entities/secure_account/view/secure_account_details.dart';
import 'package:ava_flutter/features/give_feedback/view/give_feedback_modal_bottom_sheet.dart';
import 'package:ava_flutter/features/give_feedback/view_model/show_give_feedback_provider.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/ava_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(showGiveFeedbackProvider, (prev, next) {
      if (next == true) {
        GiveFeedbackModalBottomSheet.show(context);
        ref.read(showGiveFeedbackProvider.notifier).state = false;
      }
    });
    return Scaffold(
      appBar: AvaAppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => context.pushNamed(AppRoute.settings.path),
        ),
        title: context.l10n.home,
      ),
      body: const SafeArea(
        maintainBottomViewPadding: true,
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
              SizedBox(height: 32.0),
              CreditAccountsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
