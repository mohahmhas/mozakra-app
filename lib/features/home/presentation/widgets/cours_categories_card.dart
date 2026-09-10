import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CoursCategoriesCard extends StatelessWidget {
  const CoursCategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 99.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: context.colors.primaryContainer,
        borderRadius: BorderRadius.circular(AppRadius.radius12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.svgDesign,
            width: 16.w,
            height: 16.h,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            'Design',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
