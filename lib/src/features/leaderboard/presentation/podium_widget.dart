import 'package:flutter/material.dart';
import 'package:pomakspo/src/features/leaderboard/presentation/podium_item_widget.dart';

class PodiumWidget extends StatelessWidget {
  const PodiumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> podiumItems = [
      {
        'name': 'Michal Rucka',
        'distance': 327.8,
        'position': 2,
        'image': AssetImage('assets/avatar_2.png'),
      },
      {
        'name': 'Marek Zacek',
        'distance': 483.7,
        'position': 1,
        'image': AssetImage('assets/avatar_1.png'),
      },
      {
        'name': 'Michal Rucka',
        'distance': 297.1,
        'position': 3,
        'image': AssetImage('assets/avatar_3.png'),
      },
    ];

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final item in podiumItems) ...[
              if (item['position'] == 1)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PodiumItemWidget(
                    name: item['name'],
                    distance: item['distance'],
                    rank: item['position'],
                  ),
                )
              else
                PodiumItemWidget(
                  name: item['name'],
                  distance: item['distance'],
                  rank: item['position'],
                ),
              const SizedBox(width: 12),
            ]
          ],
        ),
      ],
    );
  }
}
