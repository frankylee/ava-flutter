import 'package:ava_flutter/entities/secure_account/view/total_balance_utilization/ui/total_balance.dart';
import 'package:ava_flutter/entities/secure_account/view/total_balance_utilization/ui/total_balance_utilization_progress.dart';
import 'package:ava_flutter/entities/secure_account/view/total_balance_utilization/ui/total_balance_utilization_progress_bar.dart';
import 'package:ava_flutter/entities/secure_account/view/total_balance_utilization/ui/total_limit.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';

class TotalBalanceUtilizationCard extends StatelessWidget {
  const TotalBalanceUtilizationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.colors.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(color: context.colors.scrim.withOpacity(0.15)),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TotalBalance(),
                    TotalLimit(),
                  ],
                ),
                TotalBalanceUtilizationProgress(),
              ],
            ),
            SizedBox(height: 16.0),
            TotalBalanceUtilizationProgressBar(),
          ],
        ),
      ),
    );
  }
}
