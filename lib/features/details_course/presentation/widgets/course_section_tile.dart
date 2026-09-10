import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/features/details_course/domain/entities/course_section_entity.dart';
import 'package:e_store/features/details_course/presentation/cubit/course_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CourseSectionTile extends StatelessWidget {
  final CourseSectionEntity section;
  final bool isExpanded;

  const CourseSectionTile({
    super.key,
    required this.section,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),

      margin: EdgeInsets.only(bottom: 12.h),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16.r),

        border: Border.all(color: AppColors.lightGrey),
      ),

      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.read<CourseDetailsCubit>().toggleSection(section.id);
            },

            child: Padding(
              padding: EdgeInsets.all(16.w),

              child: Row(
                children: [
                  // i want show number of section in list of sections
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.all(8),
                    decoration: isExpanded
                        ? BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                              AppRadius.radius12,
                            ),
                          )
                        : BoxDecoration(color: AppColors.white),
                    alignment: Alignment.center,
                    child: Text(
                      section.id,
                      style: AppTextStyles.title16SemiBlod.copyWith(
                        color: isExpanded ? AppColors.white : context.textPrimary,
                      ),
                    ),
                  ),
                  horizontalSpace(12.w),
                  Expanded(
                    child: Text(
                      section.title,
                      style: AppTextStyles.titleMedium,
                    ),
                  ),

                  AnimatedRotation(
                    turns: isExpanded ? .5 : 0,
                    duration: Duration(milliseconds: 250),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),

          AnimatedCrossFade(
            duration: Duration(milliseconds: 250),

            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,

            firstChild: SizedBox.shrink(),

            secondChild: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),

              child: Column(
                children: section.lessons
                    .where((lesson) => lesson.sectionId == section.id)
                    .map(
                      (lesson) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppAssets.svgPlayer,
                              width: 20.w,
                              height: 20.h,
                              colorFilter: ColorFilter.mode(
                                lesson.isPreview
                                    ? context.primary
                                    : AppColors.lightGrey,
                                BlendMode.srcIn,
                              ),
                            ),

                            Text(
                              lesson.title,
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontWeight: FontWeightHelper.regular,
                              ),
                            ),
                            Text(' (${lesson.duration})'),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
