import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingCard extends StatelessWidget {
  final String? title;
  final String image;
  final Color color;
  const SettingCard({
    super.key,
    this.title,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.12),
          ),
          child: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        ),
        horizontalSpace(12),
        title != null
            ? Text(
                title!,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.darkWhite,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
