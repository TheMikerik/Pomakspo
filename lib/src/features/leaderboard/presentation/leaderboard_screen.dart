import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomakspo/src/core/common/widgets/appbar/custom_appbar.dart';
import 'package:pomakspo/src/core/common/widgets/rounded_scaffold.dart';
import 'package:pomakspo/src/features/leaderboard/presentation/category_carousel.dart';
import 'package:pomakspo/src/features/leaderboard/presentation/leaderboard_list_widget.dart';
import 'package:pomakspo/src/features/leaderboard/presentation/podium_widget.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCarousel(),
          const SizedBox(height: 32),
          IntrinsicHeight(
            child: PodiumWidget(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LeaderboardListWidget(),
          ),
        ],
      ),
    );
  }
}
