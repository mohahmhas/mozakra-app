import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/features/app/presentation/logic/cubit_theme/theme_cubit.dart';
import 'package:e_store/features/settings/presentation/widgets/notification_section.dart';
import 'package:e_store/features/settings/presentation/widgets/setting_section_card.dart';
import 'package:e_store/features/settings/presentation/widgets/theme_selector_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screen,
            child: Column(
              children: [
                SettingSectionCard(
                  title: 'Appearance',
                  child: BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return ThemeSelectorSection(
                        selected: state.themeMode,
                        onChanged: (value) => value == state.themeMode
                            ? null
                            : context.read<ThemeCubit>().toggleTheme(value),
                      );
                    },
                  ),
                ),
                verticalSpace(16),

                SettingSectionCard(
                  title: 'notifications',
                  child: BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return NotificationSection();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
