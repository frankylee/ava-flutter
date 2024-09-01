import 'package:ava_flutter/entities/secure_account/view_model/secure_account_notifier.dart';
import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalBalanceUtilizationProgressBar extends ConsumerWidget {
  const TotalBalanceUtilizationProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(
      SecureAccountAsyncNotifier.provider.select(
        (asyncDetails) => asyncDetails.when(
          data: (data) => TotalBalanceUtilizationProgressBarData(
            quality: data.quality,
            utilization: data.utilization,
          ),
          error: (error, stack) => const SizedBox.shrink(),
          loading: () => const TotalBalanceUtilizationProgressBarLoading(),
        ),
      ),
    );
  }
}

class TotalBalanceUtilizationProgressBarData extends StatefulWidget {
  const TotalBalanceUtilizationProgressBarData({
    super.key,
    required this.quality,
    required this.utilization,
  });

  final String quality;
  final double utilization;

  @override
  State<StatefulWidget> createState() =>
      _TotalBalanceUtilizationProgressBarDataState();
}

class _TotalBalanceUtilizationProgressBarDataState
    extends State<TotalBalanceUtilizationProgressBarData> {
  late bool _is0to9;
  late bool _is10to49;
  late bool _is50to75;

  @override
  void initState() {
    _is0to9 = widget.utilization < 0.10;
    _is10to49 = widget.utilization >= 0.10 && widget.utilization < 0.5;
    _is50to75 = widget.utilization >= 0.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _QualityExpression(
              isVisible: _is0to9,
              quality: widget.quality,
              color: context.colors.secondary,
            ),
            _QualityExpression(
              isVisible: _is10to49,
              quality: widget.quality,
              color: context.colors.tertiary.withOpacity(0.7),
            ),
            _QualityExpression(
              isVisible: widget.utilization >= 0.5,
              quality: widget.quality,
              color: context.colors.error.withOpacity(0.7),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                  color: context.colors.secondary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                    ),
                  ),
                ),
                height: 24.0,
              ),
            ),
            Expanded(
              child: Container(
                color: context.colors.tertiary.withOpacity(_is0to9 ? 0.3 : 0.7),
                height: 24.0,
              ),
            ),
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                  color:
                      context.colors.error.withOpacity(_is50to75 ? 0.7 : 0.3),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                height: 24.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TickMark(
              color: _is0to9
                  ? context.colors.secondary
                  : context.colors.outlineVariant,
              isLeft: true,
            ),
            const Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _TickMark(
                    color: _is10to49 && widget.utilization < 0.3
                        ? context.colors.tertiary.withOpacity(0.7)
                        : context.colors.outlineVariant,
                  ),
                  _TickMark(
                    color: _is10to49 && widget.utilization >= 0.3
                        ? context.colors.tertiary.withOpacity(0.7)
                        : context.colors.outlineVariant,
                  ),
                  _TickMark(
                    color: _is50to75 && widget.utilization < 0.75
                        ? context.colors.error.withOpacity(0.7)
                        : context.colors.outlineVariant,
                  ),
                ],
              ),
            ),
            const Spacer(),
            _TickMark(
              color: _is50to75 && widget.utilization >= 0.75
                  ? context.colors.error.withOpacity(0.7)
                  : context.colors.outlineVariant,
              isRight: true,
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.percentage0to9,
              style: context.textTheme.bodySmall?.copyWith(
                color:
                    _is0to9 ? context.colors.secondary : context.colors.outline,
                fontWeight: _is0to9 ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            Text(
              context.l10n.percentage10to29,
              style: context.textTheme.bodySmall?.copyWith(
                color: _is10to49 && widget.utilization < 0.3
                    ? context.colors.tertiary.withOpacity(0.7)
                    : context.colors.outline,
                fontWeight: _is10to49 && widget.utilization < 0.3
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
            Text(
              context.l10n.percentage30to49,
              style: context.textTheme.bodySmall?.copyWith(
                color: _is10to49 && widget.utilization >= 0.3
                    ? context.colors.tertiary.withOpacity(0.7)
                    : context.colors.outline,
                fontWeight: _is10to49 && widget.utilization >= 0.3
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
            Text(
              context.l10n.percentage50to74,
              style: context.textTheme.bodySmall?.copyWith(
                color: _is50to75 && widget.utilization < 0.75
                    ? context.colors.error.withOpacity(0.7)
                    : context.colors.outline,
                fontWeight: _is50to75 && widget.utilization < 0.75
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
            Text(
              context.l10n.percentage75Below,
              style: context.textTheme.bodySmall?.copyWith(
                color: _is50to75 && widget.utilization >= 0.75
                    ? context.colors.error.withOpacity(0.7)
                    : context.colors.outline,
                fontWeight: _is50to75 && widget.utilization >= 0.75
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QualityExpression extends StatelessWidget {
  const _QualityExpression({
    required this.color,
    required this.isVisible,
    required this.quality,
  });

  final Color color;
  final bool isVisible;
  final String quality;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Visibility(
          visible: isVisible,
          child: Text(
            quality,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _TickMark extends StatelessWidget {
  const _TickMark({
    required this.color,
    this.isLeft = false,
    this.isRight = false,
  });

  final Color color;
  final bool isLeft;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isLeft ? 4.0 : 0.0),
            bottomLeft: Radius.circular(isLeft ? 4.0 : 0.0),
            topRight: Radius.circular(isRight ? 4.0 : 0.0),
            bottomRight: Radius.circular(isRight ? 4.0 : 0.0),
          ),
        ),
      ),
      height: 8.0,
      width: 1.0,
    );
  }
}

class TotalBalanceUtilizationProgressBarLoading extends StatelessWidget {
  const TotalBalanceUtilizationProgressBarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerContainer(height: 24.0, width: 600.0);
  }
}
