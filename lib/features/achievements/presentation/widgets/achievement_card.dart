import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/features/achievements/domain/entities/achievement_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AchievementCard extends StatelessWidget {
  final AchievementEntity achievementEntity;
  const AchievementCard({super.key, required this.achievementEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170.h,
      child: Column(
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: achievementEntity.colorBg,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              achievementEntity.image,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                achievementEntity.colorIcon,
                BlendMode.srcIn,
              ),
            ),
          ),
          verticalSpace(8),
          Text(
            achievementEntity.name,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          verticalSpace(8),
          Text(
            achievementEntity.achievement,
            style: AppTextStyles.title12SemiBlod.copyWith(
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
