import 'package:flutter/material.dart';
import 'package:pomakspo/src/core/common/providers/haptic_feedback_provider.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryButton extends ConsumerWidget {
  const PrimaryButton({
    required this.text,
    this.isLoading = false,
    this.height = 60,
    this.borderRadius = 16,
    this.expanded = true,
    this.outlined = false,
    this.color,
    this.textColor,
    this.onPressed,
    this.icon,
    super.key,
  });

  final String text;
  final bool isLoading;
  final double height;
  final double borderRadius;
  final bool expanded;
  final bool outlined;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      height: height,
      child: outlined
          ? OutlinedButton(
              style: ButtonStyle(
                side: WidgetStateProperty.all(
                  BorderSide(color: color ?? context.c.primary),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              onPressed: isLoading
                  ? null
                  : () {
                      if (onPressed != null) {
                        ref.read(hapticProvider.notifier).vibrate();
                        onPressed!();
                      }
                    },
              child: _buildContent(context),
            )
          : FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  isLoading
                      ? (color?.withAlpha(80) ??
                          context.c.primary.withAlpha(80))
                      : (color ?? context.c.primary),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              onPressed: isLoading
                  ? null
                  : () {
                      if (onPressed != null) {
                        ref.read(hapticProvider.notifier).vibrate();
                        onPressed!();
                      }
                    },
              child: _buildContent(context),
            ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final Color effectiveTextColor = isLoading
        ? (textColor?.withAlpha(75) ?? context.c.surface)
        : (textColor ?? (outlined ? context.c.primary : context.c.onPrimary));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: effectiveTextColor,
            size: 30,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.t.bodyLarge!.copyWith(
            color: effectiveTextColor,
          ),
        ),
      ],
    );
  }
}
