import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomakspo/src/core/common/widgets/appbar/custom_appbar.dart';
import 'package:pomakspo/src/core/common/widgets/rounded_scaffold.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  static const routePath = '/leaderboard';
  static const name = 'leaderboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RoundedScaffold(
      appbar: CustomAppbar(
        title: 'Zebricek',
        displayAction: false,
        displayLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryTab(context, 'Běh', Icons.directions_run, true),
                _buildCategoryTab(
                    context, 'Chůze', Icons.directions_walk, false),
                _buildCategoryTab(context, 'Chu', Icons.directions_walk, false),
              ],
            ),
            const SizedBox(height: 20),

            // Podium for Top 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPodiumItem(
                    context, 2, 'Michal Rucka', '327.8 km', Colors.grey),
                _buildPodiumItem(
                    context, 1, 'Marek Zacek', '483.7 km', Colors.orange),
                _buildPodiumItem(
                    context, 3, 'Eliska Jurickova', '297.1 km', Colors.grey),
              ],
            ),
            const SizedBox(height: 20),

            // User's Current Position
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Tvůj aktuální pozice',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '58.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // List of Other Ranks
            _buildRankItem(context, 4, 'Stanislav Urban', '250.7 km'),
            _buildRankItem(context, 5, 'Jan Jecminek', '238.7 km'),
            _buildRankItem(context, 6, 'David Rychecky', '195.1 km'),
            _buildRankItem(context, 7, 'Karolina Maceckova', '155.2 km'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTab(
      BuildContext context, String title, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.withOpacity(0.2) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.orange : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodiumItem(BuildContext context, int rank, String name,
      String distance, Color borderColor) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
            ),
            CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.grey[400]),
            ),
            Positioned(
              top: 0,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: borderColor,
                child: Text(
                  rank.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          distance,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildRankItem(
      BuildContext context, int rank, String name, String distance) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey[300],
            child: Text(
              rank.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 30, color: Colors.grey[400]),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            distance,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
