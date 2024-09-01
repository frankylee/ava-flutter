import 'package:ava_flutter/entities/secure_account/view/credit_limit_utilization/ui/credit_limit.dart';
import 'package:ava_flutter/entities/secure_account/view/credit_limit_utilization/ui/credit_limit_balance.dart';
import 'package:ava_flutter/entities/secure_account/view/credit_limit_utilization/ui/credit_limit_utilization.dart';
import 'package:ava_flutter/entities/secure_account/view/credit_limit_utilization/ui/credit_limit_utilization_slider.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';

class CreditLimitUtilizationCard extends StatelessWidget {
  const CreditLimitUtilizationCard({super.key});

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
        padding: EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 20.0),
        child: Column(
          children: [
            CreditLimitUtilizationSlider(),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreditLimitBalance(),
                CreditLimit(),
              ],
            ),
            SizedBox(height: 10.0),
            Divider(),
            SizedBox(height: 8.0),
            CreditLimitUtilization(),
          ],
        ),
      ),
    );
  }
}
