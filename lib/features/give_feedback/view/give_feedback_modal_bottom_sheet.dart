// ignore_for_file: use_build_context_synchronously

import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:ava_flutter/shared/ui/button/primary_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

/// Show the modal bottom sheet by calling the [GiveFeedbackModalBottomSheet]
/// `show()` function and pass in the [BuildContext].
class GiveFeedbackModalBottomSheet extends StatefulWidget {
  const GiveFeedbackModalBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return Future.delayed(
      const Duration(milliseconds: 250),
      () => showModalBottomSheet(
        context: context,
        backgroundColor: context.colors.onPrimaryFixedVariant,
        builder: (context) => const GiveFeedbackModalBottomSheet(),
        isScrollControlled: true,
        useSafeArea: true,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _GiveFeedbackModalBottomSheetState();
}

class _GiveFeedbackModalBottomSheetState
    extends State<GiveFeedbackModalBottomSheet> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: context.colors.onPrimaryFixedVariant,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
          ),
          height: 24.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Container(
            decoration: ShapeDecoration(
              color: context.colors.surface,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
            ),
            height: (MediaQuery.sizeOf(context).height / 2.25) +
                MediaQuery.of(context).viewInsets.bottom,
            width: MediaQuery.sizeOf(context).width,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 48.0),
                    Expanded(
                      child: Text(
                        context.l10n.giveUsFeedback,
                        style: context.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings_outlined,
                        color: context.colors.onPrimary,
                        size: 20.0,
                      ),
                      onPressed: () => HapticFeedback.lightImpact(),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextField(
                  autofocus: true,
                  controller: _controller,
                  maxLines: 6,
                ),
                const SizedBox(height: 12.0),
                PrimaryFilledButton(
                  label: context.l10n.sendFeedback,
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
