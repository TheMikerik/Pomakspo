import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.size = 52,
    this.iconSizeDivider,
    this.onTap,
    super.key,
  });

  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSizeDivider;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? context.c.surface,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Icon(
              icon ?? HugeIcons.strokeRoundedArrowLeft01,
              color: iconColor ?? context.c.onSurface.withAlpha(200),
              size: iconSizeDivider != null
                  ? size * iconSizeDivider!
                  : size * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
