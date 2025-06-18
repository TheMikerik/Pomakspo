import 'package:flutter/material.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';
import 'package:pomakspo/src/features/leaderboard/presentation/category_item_widget.dart';

// Example widget that holds the carousel
class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      CategoryItemWidget(
        icon: Icons.directions_run,
        title: "Beh",
        onTap: () {},
        isSelected: true,
      ),
      CategoryItemWidget(
        icon: Icons.directions_walk,
        title: "Chuze",
        onTap: () {},
      ),
      CategoryItemWidget(
        icon: Icons.directions_walk,
        title: "Chuze 2",
        onTap: () {},
      ),
      CategoryItemWidget(
        icon: Icons.directions_walk,
        title: "Chuze 2",
        onTap: () {},
      ),
      CategoryItemWidget(
        icon: Icons.directions_walk,
        title: "Chuze 2",
        onTap: () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'Kategorie',
            style: context.t.titleLarge!.copyWith(
              color: context.c.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              for (final item in items)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: item,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
