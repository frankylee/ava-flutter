import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.borderRadius,
    required this.height,
    required this.width,
  });

  final double? borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.onPrimary,
      highlightColor: context.colors.primaryContainer,
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
