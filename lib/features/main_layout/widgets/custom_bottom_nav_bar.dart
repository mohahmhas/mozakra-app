import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/main_layout/presentation/cubit/cubit/bottom_nav_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space8),
      decoration: BoxDecoration(
        color: context.bottomNav.background,
        boxShadow: [context.bottomNav.shadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(
            context,
            index: 0,
            icon: AppAssets.svgHomeBtBarIcon,
            label: LocaleKeys.home.tr(),
          ),

          _item(
            context,
            index: 1,
            icon: AppAssets.svgCoursesBtBarIcon,
            label: LocaleKeys.courses.tr(),
          ),

          _item(
            context,
            index: 2,
            icon: AppAssets.svgAchievementsBtBarIcon,
            label: LocaleKeys.achievements.tr(),
          ),

          _item(
            context,
            index: 3,
            icon: AppAssets.svgSocietyBtBarIcon,
            label: LocaleKeys.community.tr(),
          ),

          _item(
            context,
            index: 4,
            icon: AppAssets.svgProfile,
            label: LocaleKeys.profile.tr(),
          ),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required int index,
    required String icon,
    required String label,
  }) {
    final cubit = context.read<BottomNavCubit>();

    final currentIndex = context.watch<BottomNavCubit>().state.currentIndex;

    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        cubit.changeBottomNav(index);
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.space8,
          horizontal: AppSpacing.space8,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? context.bottomNav.selectedBackground
              : Colors.transparent,

          borderRadius: context.bottomNav.borderRadius,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? context.bottomNav.selectedIcon
                    : context.bottomNav.unselectedIcon,

                BlendMode.srcIn,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              label,

              style: context.theme.textTheme.titleSmall!.copyWith(
                color: isSelected
                    ? context.bottomNav.selectedText
                    : context.bottomNav.unselectedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
