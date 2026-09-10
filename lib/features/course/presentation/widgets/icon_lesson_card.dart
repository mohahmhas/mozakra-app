import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconLessonCard extends StatelessWidget {
  final String imageIcon;
  final Color colorData;

  final String titel;
  final String subTitel;
  const IconLessonCard({
    super.key,

    required this.colorData,
    required this.imageIcon,
    required this.titel,
    required this.subTitel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.w,
      child: Row(
        children: [
          iconLeesonCaed(),
          horizontalSpace(16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titel,
                  style: AppTextStyles.title18SemiBlod.copyWith(
                    color: context.textPrimary,
                  ),
                ),
                Text(
                  subTitel,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: context.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container iconLeesonCaed() {
    return Container(
      width: 48.w,
      height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        color: colorData,
      ),
      child: SvgPicture.asset(
        imageIcon,
        fit: BoxFit.scaleDown,
        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
    );
  }
}
