import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/app/presentation/logic/cubit_localization/localization_cubit.dart';
import 'package:e_store/features/settings/presentation/widgets/chang_lang_menu_tile.dart';
import 'package:e_store/features/settings/presentation/widgets/language_bottom_sheet.dart';
import 'package:e_store/features/settings/presentation/widgets/setting_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectorSection extends StatelessWidget {
  final ThemeMode selected;
  final ValueChanged<ThemeMode>? onChanged;
  const ThemeSelectorSection({
    super.key,
    required this.selected,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingCard(
          title: LocaleKeys.feature.tr(),
          image: AppAssets.svgAppearance,
          color: AppColors.leanerEnd,
        ),
        verticalSpace(16),
        Row(
          children: [
            horizontalSpace(5),
            _ThemeItem(
              title: 'Light',
              selected: selected == ThemeMode.light,
              onTap: () => onChanged!(ThemeMode.light),
            ),
            horizontalSpace(16),
            _ThemeItem(
              title: 'Dark',
              selected: selected == ThemeMode.dark,
              onTap: () => onChanged!(ThemeMode.dark),
            ),
            _ThemeItem(
              title: 'System',
              selected: selected == ThemeMode.system,
              onTap: () => onChanged!(ThemeMode.system),
            ),
          ],
        ),
        verticalSpace(16),
        BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return ChangLangMenuTile(
              title: LocaleKeys.language.tr(),
              subTitle: state.locale.languageCode == "ar"
                  ? 'Arabic (RTL)'
                  : 'English (LTR)',
              onTap: () {
                showModalBottomSheet(
                  context: context,

                  isScrollControlled: true,

                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),

                  builder: (_) => const LanguageBottomSheet(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _ThemeItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),

          child: Text(
            title,
            style: TextStyle(
              color: selected ? AppColors.leanerEnd : AppColors.darkGrey,
            ),
          ),
        ),
      ),
    );
  }
}
