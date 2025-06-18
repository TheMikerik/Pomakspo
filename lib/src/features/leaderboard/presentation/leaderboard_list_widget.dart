import 'package:flutter/material.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';

class LeaderboardListWidget extends StatelessWidget {
  const LeaderboardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> podiumItems = [
      {
        'name': 'Michal Rucka',
        'distance': 327.8,
        'position': 4,
        'image': AssetImage('assets/avatar_2.png'),
      },
      {
        'name': 'Michal Rucka',
        'distance': 327.8,
        'position': 5,
        'image': AssetImage('assets/avatar_2.png'),
      },
      {
        'name': 'Michal Rucka',
        'distance': 327.8,
        'position': 6,
        'image': AssetImage('assets/avatar_2.png'),
      },
      {
        'name': 'Michal Rucka',
        'distance': 327.8,
        'position': 7,
        'image': AssetImage('assets/avatar_2.png'),
      },
      {
        'name': 'Marek Zacek',
        'distance': 483.7,
        'position': 8,
        'image': AssetImage('assets/avatar_1.png'),
      },
      {
        'name': 'Michal Rucka',
        'distance': 297.1,
        'position': 9,
        'image': AssetImage('assets/avatar_3.png'),
      },
    ];

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: _currentPositionWidget(context),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: podiumItems.length,
            itemBuilder: (context, index) {
              final user = podiumItems[index];

              return ListTile(
                leading: Text(
                  "${user['position']}.",
                  style: context.t.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Text(
                  user['name'],
                  style: context.t.titleMedium,
                ),
                trailing: Text(
                  "${user['distance']} km",
                  style: context.t.bodyLarge,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _currentPositionWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          decoration: BoxDecoration(
            color: context.c.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Text(
                'Tvá aktuální pozice',
                style: context.t.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text(
                '58.',
                style: context.t.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
