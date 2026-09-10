import 'package:e_store/core/facke_data.dart';
import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_section_header.dart';
import 'package:e_store/core/shared/widgets/course_card.dart';
import 'package:e_store/core/shared/widgets/custom_app_bar.dart';
import 'package:e_store/core/shared/widgets/notification_button.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/home/data/model/continue_learning_course.dart';
import 'package:e_store/features/home/presentation/widgets/continue_learning_section.dart';
import 'package:e_store/features/home/presentation/widgets/cours_categories.dart';
import 'package:e_store/features/home/presentation/widgets/home_header.dart';
import 'package:e_store/features/profile/presentation/widgets/user_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HomeHeader(),
                SizedBox(height: 32.h),
                ContinueLearningSection(
                  courses: [
                    ContinueLearningCourse(
                      id: '1',
                      title: 'Flutter for Beginners',
                      decription: 'Learn the basics of Flutter development.',
                      instructorName: 'ali',
                      progress: 0.55,
                    ),
                    ContinueLearningCourse(
                      id: '2',
                      title: 'Advanced Flutter',
                      decription: 'Take your Flutter skills to the next level.',
                      instructorName: 'ali',
                      progress: 0.30,
                    ),
                    ContinueLearningCourse(
                      id: '3',
                      title: 'Flutter Animations',
                      decription: 'Master animations in Flutter.',
                      instructorName: 'ali',
                      progress: 0.75,
                    ),
                  ],
                ),

                SizedBox(height: 32.h),
                AppSectionHeader(
                  title: LocaleKeys.courses.tr(),
                  actionText: LocaleKeys.seeAll.tr(),
                  onActionTap: () {
                    // Handle "See All" tap
                  },
                ),
                SizedBox(height: 16.h),

                //course categories
                CoursCategories(),
                verticalSpace(16),
                AppSectionHeader(
                  title: LocaleKeys.featuredCourses.tr(),
                  actionIcon: AppAssets.svgFilter,
                  onActionTap: () {
                    // Handle "See All" tap
                  },
                ),
                verticalSpace(16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: coursesFake.length,
                  separatorBuilder: (context, index) => verticalSpace(16),
                  itemBuilder: (context, index) =>
                      CourseCard(course: coursesFake[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//fake data for continue learning courses
