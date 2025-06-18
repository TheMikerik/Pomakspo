import 'package:flutter/material.dart';
import 'package:pomakspo/src/core/extensions/theme_data_extension.dart';

class PodiumItemWidget extends StatelessWidget {
  const PodiumItemWidget({
    super.key,
    required this.rank,
    required this.name,
    required this.distance,
  });
  final int rank;
  final String name;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: rank == 1 ? 63 : 50,
              backgroundColor: rank == 1 ? context.c.primary : Colors.grey[400],
            ),
            CircleAvatar(
              radius: rank == 1 ? 60 : 48,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: rank == 1 ? context.c.primary : Colors.grey[400],
              ),
            ),
            Positioned(
              bottom: -10,
              child: CircleAvatar(
                radius: rank == 1 ? 18 : 12,
                backgroundColor:
                    rank == 1 ? context.c.primary : Colors.grey[400],
                child: Text(
                  rank.toString(),
                  style: context.t.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: rank == 1 ? 16 : 12,
                  ),
                  // const TextStyle(
                  //   color: Colors.white,
                  //   fontWeight: FontWeight.bold,
                  // ),
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
          "$distance",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
