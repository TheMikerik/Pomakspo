import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pomakspo/src/core/common/widgets/buttons/circle_button.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    this.title,
    this.action,
    this.leading,
    this.displayAction = true,
    this.displayLeading = true,
    super.key,
  });

  final String? title;
  final Widget? action;
  final Widget? leading;
  final bool displayAction;
  final bool displayLeading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (title != null)
              Center(
                child: Text(
                  title!,
                  style: context.t.headlineLarge!.copyWith(
                    color: context.c.surface,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                displayLeading
                    ? (leading ?? CircleButton(iconSizeDivider: 0.65))
                    : const SizedBox(width: 48),
                const Spacer(),
                displayAction
                    ? (action ??
                        CircleButton(icon: HugeIcons.strokeRoundedSettings01))
                    : const SizedBox(width: 48),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
