import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_gradients.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,

    required this.text,
    required this.onPressed,

    this.width = double.infinity,
    this.height = 56,

    this.isLoading = false,
    this.enabled = true,

    this.icon,

    this.borderRadius,

    this.gradient,

    this.backgroundColor,

    this.textColor,

    this.borderColor,

    this.elevation = 0,

    this.padding,
  });

  final String text;

  final VoidCallback? onPressed;

  final double width;
  final double height;

  final bool isLoading;

  final bool enabled;

  final Widget? icon;

  final double? borderRadius;

  final Gradient? gradient;

  final Color? backgroundColor;

  final Color? textColor;

  final Color? borderColor;

  final double elevation;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = !enabled || onPressed == null;

    return Opacity(
      opacity: isDisabled ? 0.6 : 1,

      child: Container(
        width: width,
        height: height.h,

        decoration: BoxDecoration(
          gradient: isDisabled
              ? null
              : gradient ?? AppGradients.primaryGradient,

          color: isDisabled ? AppColors.grey : backgroundColor,

          borderRadius: BorderRadius.circular(
            borderRadius ?? AppRadius.radius12,
          ),

          border: borderColor != null ? Border.all(color: borderColor!) : null,

          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: elevation,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Material(
          color: Colors.transparent,

          child: InkWell(
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppRadius.radius12,
            ),

            onTap: isDisabled || isLoading ? null : onPressed,

            child: Padding(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),

              child: Center(
                child: isLoading
                    ? SizedBox(
                        width: 22.w,
                        height: 22.h,

                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          if (icon != null) ...[icon!, SizedBox(width: 8.w)],

                          Text(
                            text,

                            style: context.theme.textTheme.titleLarge?.copyWith(
                              color: textColor ?? context.textPrimary,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
