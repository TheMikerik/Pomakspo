import 'package:flutter/material.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? context.c.primaryContainer : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isSelected ? context.c.primary.withAlpha(150) : Colors.grey[400]!,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? context.c.primary : Colors.black.withAlpha(200),
            size: 35,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: context.t.bodyLarge!.copyWith(
              color:
                  isSelected ? context.c.primary : Colors.black.withAlpha(200),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
