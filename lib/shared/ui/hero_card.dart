import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.colors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 24.0),
        child: child,
      ),
    );
  }
}
