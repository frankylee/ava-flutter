import 'package:ava_flutter/entities/credit_score/model/credit_score_history.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreditScoreChart extends StatelessWidget {
  const CreditScoreChart({
    super.key,
    required this.history,
  });

  final CreditScoreHistory history;

  @override
  Widget build(BuildContext context) {
    // We have to reverse the list in order to access it in chronological order.
    final chronologicalHistory = history.history.reversed;
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: LayoutBuilder(
          builder: (context, constraints) => LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  color: context.colors.secondary,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, p1, p2, ind) {
                      return FlDotCirclePainter(
                        color: context.colors.onSecondary,
                        strokeColor: context.colors.secondary,
                        strokeWidth: 2.0,
                        radius: 3,
                      );
                    },
                  ),
                  isCurved: false,
                  spots: List.generate(
                    12,
                    (ind) => FlSpot(
                      double.parse('$ind'),
                      double.parse(
                        '${chronologicalHistory.elementAt(ind).score}',
                      ),
                    ),
                  ),
                ),
              ],
              titlesData: const FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 36),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: context.colors.scrim.withOpacity(0.15),
                  strokeWidth: 1.0,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: context.colors.scrim.withOpacity(0.15),
                  ),
                ),
              ),
            ),
            duration: const Duration(milliseconds: 3000),
            curve: Curves.bounceInOut,
          ),
        ),
      ),
    );
  }
}
