import 'package:flutter/material.dart';

class FloatingCard extends StatelessWidget {
  const FloatingCard({
    required this.child,
    this.borderRadius = 20,
    this.backgroundColor = Colors.white,
    super.key,
  });

  final Widget child;
  final double borderRadius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 40,
            spreadRadius: 2,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}
