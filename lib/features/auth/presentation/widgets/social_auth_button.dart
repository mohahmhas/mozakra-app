import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,

    required this.title,
    required this.iconPath,
    required this.onPressed,

    this.width,
    this.height = 56,

    this.backgroundColor = Colors.white,

    this.borderColor,

    this.textColor,

    this.borderRadius,
  });

  final String title;

  final String iconPath;

  final VoidCallback onPressed;

  final double? width;

  final double height;

  final Color backgroundColor;

  final Color? borderColor;

  final Color? textColor;

  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.sm),

      onTap: onPressed,

      child: Container(
        height: height.h,
        padding: const EdgeInsets.symmetric(horizontal: 41, vertical: 15),
        width: width,

        decoration: BoxDecoration(
          color: context.surface,

          borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.sm),

          border: Border.all(color: borderColor ?? context.colorsBorder),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(
              iconPath,

              height: 24.sp,
              width: 24.sp,

              fit: BoxFit.contain,
            ),

            SizedBox(width: AppSpacing.space8),

            Text(
              title,

              style: AppTextStyles.bodyLarge.copyWith(
                color: textColor ?? context.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
