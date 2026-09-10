import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,

    required this.title,
    required this.iconPath,

    this.onTap,

    this.isLogout = false,
  });

  final String title;
  final String iconPath;

  final VoidCallback? onTap;

  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,

      leading: SvgPicture.asset(
        iconPath,

        colorFilter: isLogout
            ? ColorFilter.mode(context.onSurface, BlendMode.srcIn)
            : null,
      ),

      title: Text(
        title,

        style: context.theme.textTheme.bodyLarge?.copyWith(
          color: isLogout ? context.colors.error : context.onSurface,

          fontWeight: FontWeightHelper.medium,
        ),
      ),

      trailing: isLogout
          ? null
          : SvgPicture.asset(
              context.isArabic
                  ? AppAssets.svgArrowbackAr
                  : AppAssets.svgArrowbackEn,
              height: AppSpacing.space12,
              colorFilter: ColorFilter.mode(context.onSurface, BlendMode.srcIn),
            ),
    );
  }
}
