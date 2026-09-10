import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_section_header.dart';
import 'package:e_store/core/shared/widgets/custom_app_bar.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/features/course/domain/entities/course_entity.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_description.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_header_info.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_price_bar.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_sections_list.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_title.dart';
import 'package:e_store/features/details_course/presentation/widgets/course_video_preview.dart';
import 'package:e_store/features/details_course/presentation/widgets/instructor_card.dart';
import 'package:e_store/features/details_course/presentation/widgets/student_reviews_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseDetailsScreen extends StatelessWidget {
  final CourseEntity course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          horizontalSpace(8.0),
          TitleApp(),
          Spacer(),
          Container(
            width: AppSpacing.space36,
            height: AppSpacing.space36,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('A')),
          ),
          horizontalSpace(10.0),
          Icon(Icons.notifications_none_outlined, size: AppSpacing.space36),
          horizontalSpace(10.0),
        ],
      ),
      body: Padding(
        padding: AppPadding.screen,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseVideoPreview(),
              //----------------------------------------
              verticalSpace(24.h),
              CourseHeaderInfo(course: course),
              verticalSpace(8),
              CourseTitle(title: course.title),
              CourseDescription(description: course.description),
              //----------------------------------------info for instructor
              verticalSpace(67),
              InstructorCard(course: course),

              verticalSpace(42),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        AppAssets.svgLanguage,
                        width: 20.w,
                        height: 20.h,
                      ),
                      verticalSpace(4),
                      Text(
                        'language',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                      verticalSpace(4),
                      Text(
                        course.language,
                        style: AppTextStyles.title14SemiBlod.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        AppAssets.svgDurationTime,
                        width: 20.w,
                        height: 20.h,
                      ),
                      verticalSpace(4),
                      Text(
                        'Time',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                      verticalSpace(4),
                      Text(
                        course.duration,
                        style: AppTextStyles.title14SemiBlod.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(32),
              AppSectionHeader(
                title: 'Course Sections',
                actionText:
                    '${course.sections.length} Sections ${course.sections.first.lessons.length} Lessons ',
                onActionTap: () {
                  // Handle "See All" tap
                },
              ),
              verticalSpace(24),
              CourseSectionsList(course: course),
              // openion of students
              verticalSpace(49),
              AppSectionHeader(title: 'Student Reviews'),
              verticalSpace(32),
              StudentReviewsList(reviews: course.reviews),
              verticalSpace(32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CoursePriceBar(course: course),
    );
  }
}
