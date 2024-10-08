import 'dart:async';

import 'package:ava_flutter/entities/credit_score/model/credit_score.dart';
import 'package:ava_flutter/entities/credit_score/model/credit_score_history.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreditScoreChart extends StatefulWidget {
  const CreditScoreChart({
    super.key,
    required this.history,
  });

  final CreditScoreHistory history;

  @override
  State<StatefulWidget> createState() => _CreditScoreChartState();
}

class _CreditScoreChartState extends State<CreditScoreChart> {
  late List<CreditScore> _chronologicalHistory;
  late Timer _timer;

  late final List<FlSpot> _spots = [];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    // We have to reverse the list in order to access it in chronological order.
    _chronologicalHistory = widget.history.history.reversed.toList();
    // Use a timer to periodically add new spots to the graph.
    _timer = Timer.periodic(const Duration(milliseconds: 0), (timer) {
      while (_spots.length < _chronologicalHistory.length) {
        setState(() {
          _spots.add(
            FlSpot(
              _index.toDouble(),
              _chronologicalHistory.elementAt(_index).score.toDouble(),
            ),
          );
          _index += 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  show: _spots.isNotEmpty,
                  spots: _spots,
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) =>
                      context.colors.secondaryContainer,
                ),
              ),
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
            duration: const Duration(milliseconds: 2500),
            curve: Curves.bounceInOut,
          ),
        ),
      ),
    );
  }
}
