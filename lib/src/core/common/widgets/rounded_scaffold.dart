import 'package:flutter/material.dart';
import 'package:pomakspo/src/core/common/widgets/appbar/custom_appbar.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';

class RoundedScaffold extends StatelessWidget {
  const RoundedScaffold({
    required this.appbar,
    required this.body,
    this.backgroundColor,
    this.innerBackgroundColor,
    this.padding = const EdgeInsets.all(16),
    super.key,
  });

  final CustomAppbar appbar;
  final Widget body;
  final Color? backgroundColor;
  final Color? innerBackgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final Color outerColor = backgroundColor ?? context.c.primary;
    final Color innerColor = innerBackgroundColor ?? context.c.surface;

    return Scaffold(
      backgroundColor: outerColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: appbar,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: innerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                padding: padding,
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
