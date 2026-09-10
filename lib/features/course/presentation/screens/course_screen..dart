// ignore: file_names
import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_section_header.dart';
import 'package:e_store/core/shared/widgets/custom_app_bar.dart';
import 'package:e_store/core/shared/widgets/notification_button.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/course/presentation/widgets/course_lesson_tabs.dart';
import 'package:e_store/features/course/presentation/widgets/icon_lesson_card.dart';
import 'package:e_store/features/course/presentation/widgets/list_of_lesson.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_description.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_title.dart';
import 'package:e_store/features/profile/presentation/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 219.h,
            color: AppColors.primary,
            child: Center(child: Icon(Icons.play_circle_fill_rounded)),
          ),
          verticalSpace(24),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: AppPadding.screen,
                child: Column(
                  children: [
                    CourseTitle(title: 'Lesson4:Flutter Stateless Widget'),
                    CourseDescription(
                      description:
                          'this lesson to show how implemention Stateless Widget',
                    ),
                    verticalSpace(24),
                    CourseLessonTabs(),
                    verticalSpace(24),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svgNote,
                          width: 16.w,
                          height: 20.h,
                        ),
                        horizontalSpace(4),
                        Text(
                          "Lesson Summary",
                          style: AppTextStyles.title18SemiBlod,
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    SizedBox(
                      width: double.infinity,
                      height: 130.h,
                      child: Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                        style: AppTextStyles.bodyLarge,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    verticalSpace(49),
                    IconLessonCard(
                      colorData: AppColors.move,
                      imageIcon: AppAssets.svgExercise,
                      titel: "Exame",
                      subTitel: "5 Q to test your self",
                    ),
                    verticalSpace(16),
                    IconLessonCard(
                      colorData: AppColors.mintGreen,
                      imageIcon: AppAssets.svgNote,
                      titel: "Exame",
                      subTitel: "5 Q to test your self",
                    ),
                    verticalSpace(24),
                    AppSectionHeader(title: 'List of lessons'),
                    verticalSpace(24),
                    ListOfLesson(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.leanerEnd, AppColors.leanerMed],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: AppColors.error,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AppAssets.svgAddNots, fit: BoxFit.scaleDown),
      ),
    );
  }
}
