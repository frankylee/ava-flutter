import 'package:ava_flutter/entities/credit_score/view/credit_score_card_header.dart';
import 'package:ava_flutter/entities/credit_score/view/credit_score_progress.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/hero_card.dart';
import 'package:flutter/material.dart';

class CreditScoreHeroCard extends StatelessWidget {
  const CreditScoreHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroCard(
      child: Container(
        decoration: ShapeDecoration(
          color: context.colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CreditScoreCardHeader(),
              CreditScoreProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
