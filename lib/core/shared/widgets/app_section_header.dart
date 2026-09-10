import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/font_weight_helper.dart';

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.actionIcon,
  });

  final String title;

  final String? actionText;

  final String? actionIcon; // svg asset path for action icon

  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.bold,
          ),
        ),

        if (actionText != null)
          InkWell(
            onTap: onActionTap,
            child: Text(
              actionText!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.primary,
              ),
            ),
          ),
        // action Icon svg
        if (actionIcon != null)
          InkWell(
            onTap: onActionTap,
            child: SvgPicture.asset(
              actionIcon!,
              width: 18.w,
              height: 16.h,
              colorFilter: ColorFilter.mode(
                context.colors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
      ],
    );
  }
}
