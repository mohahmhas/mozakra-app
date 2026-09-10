import 'package:e_store/features/achievements/domain/entities/achievement_entity.dart';
import 'package:e_store/features/achievements/presentation/widgets/achievement_card.dart';
import 'package:flutter/material.dart';

class RecentAchievementsSection extends StatelessWidget {
  final List<AchievementEntity> achievementList;
  const RecentAchievementsSection({super.key, required this.achievementList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: achievementList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return AchievementCard(achievementEntity: achievementList[index]);
          },
        );
      },
    );
  }
}
