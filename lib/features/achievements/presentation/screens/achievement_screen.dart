import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_section_header.dart';
import 'package:e_store/core/shared/widgets/custom_app_bar.dart';
import 'package:e_store/core/shared/widgets/notification_button.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/achievements/domain/entities/achievement_entity.dart';
import 'package:e_store/features/achievements/domain/entities/certificate_entity.dart';
import 'package:e_store/features/achievements/domain/entities/course_progress_entity.dart';
import 'package:e_store/features/achievements/domain/entities/weekly_activity.dart';
import 'package:e_store/features/achievements/presentation/widgets/certificate_section.dart';
import 'package:e_store/features/achievements/presentation/widgets/course_progress_section.dart';
import 'package:e_store/features/achievements/presentation/widgets/recent_achievements_section.dart';
import 'package:e_store/features/achievements/presentation/widgets/weekly_activity_chart.dart';
import 'package:e_store/features/profile/presentation/widgets/user_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,

        title: const TitleApp(),

        actions: const [
          UserAvatar(name: "Ahmed"),

          NotificationButton(),

          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(31),
              Text(
                '${LocaleKeys.welcome.tr()}, Ahmed 👋',
                style: AppTextStyles.title28Blod,
              ),
              verticalSpace(4),
              Text(
                'You have completed 85% of your learning goals for this week.',
                style: AppTextStyles.bodyLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(24),
              AppSectionHeader(
                title: LocaleKeys.weeklyActivity.tr(),
                actionText: '14 ${LocaleKeys.hourInTotal.tr()}',
              ),
              verticalSpace(24),
              WeeklyActivityChart(
                data: [
                  WeeklyActivity(day: "Sat", value: 0.5),
                  WeeklyActivity(day: "Sun", value: 0.95),
                  WeeklyActivity(day: "Mon", value: 0.9),
                  WeeklyActivity(day: "Tue", value: 0.8),
                  WeeklyActivity(day: "Wed", value: 0.7),
                  WeeklyActivity(day: "Thu", value: 0.6),
                  WeeklyActivity(day: "Fri", value: 0.5),
                ],
              ),

              verticalSpace(49),
              AppSectionHeader(title: 'Skills distribution'),
              verticalSpace(24),
              // /// Progress
              CourseProgressSection(
                courses: [
                  CourseProgress(title: "Flutter", progress: 0.7),
                  CourseProgress(title: "Dart", progress: 0.5),
                  CourseProgress(title: "Clean Architecture", progress: 0.3),
                ],
              ),
              verticalSpace(24),
              // /// Certificates
              AppSectionHeader(
                title: 'My certificates',
                actionText: 'View all',
              ),
              verticalSpace(24),
              CertificateSection(
                certificates: [
                  CertificateEntity(
                    id: '1',
                    title: "Flutter Basics",
                    date: "Jan 2026",
                    issuedAt: DateTime(2006),
                  ),
                  CertificateEntity(
                    id: '1',
                    title: "Flutter Basics",
                    date: "Jan 2026",
                    issuedAt: DateTime(2006),
                  ),
                  CertificateEntity(
                    id: '1',
                    title: "Flutter Basics",
                    date: "Jan 2026",
                    issuedAt: DateTime(2006),
                  ),
                  CertificateEntity(
                    id: '1',
                    title: "Flutter Basics",
                    date: "Jan 2026",
                    issuedAt: DateTime(2006),
                  ),
                ],
              ),

              //----------------------------------------------------------------
              AppSectionHeader(title: LocaleKeys.recentAchievements.tr()),
              verticalSpace(24),
              RecentAchievementsSection(
                achievementList: [
                  AchievementEntity(
                    id: '1',
                    achievement: "Proud of you!",
                    image: AppAssets.svgCertficationIcon,
                    name: 'First certificate',
                    colorBg: AppColors.certificationckground,
                    colorIcon: AppColors.certificationIcon,
                  ),
                  AchievementEntity(
                    id: '2',
                    achievement: "100 consecutive days",
                    image: AppAssets.svgEducationGoold,
                    name: 'Golden learner',
                    colorBg: AppColors.goaldLearnBackground,
                    colorIcon: AppColors.goaldLearnIcon,
                  ),
                  AchievementEntity(
                    id: '3',
                    achievement: "10 days work",
                    image: AppAssets.svgCooperatingIcon,
                    name: 'Cooperating',
                    colorBg: AppColors.achivementkground,
                    colorIcon: AppColors.achivementIcon,
                  ),
                  AchievementEntity(
                    id: '4',
                    achievement: "20 hours/week",
                    image: AppAssets.svgActivity,
                    name: 'Intense activity',
                    colorBg: AppColors.activitykground,
                    colorIcon: AppColors.activityIcon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
