import 'package:ava_flutter/shared/extension/build_context_ext.dart';
import 'package:flutter/material.dart';

class AvaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AvaAppBar({
    super.key,
    this.leading,
    this.title,
  });

  final Widget? leading;
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.primary,
      centerTitle: true,
      foregroundColor: context.colors.onPrimary,
      leading: leading,
      title: title != null
          ? Text(
              title!,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }
}
