import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/router/routes.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/widgets/custom_app_bar.dart';
import 'package:e_store/core/shared/widgets/notification_button.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/profile/presentation/widgets/ai_assistant_container.dart';
import 'package:e_store/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:e_store/features/profile/presentation/widgets/user_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          centerTitle: false,

          title: const TitleApp(),

          actions: const [
            UserAvatar(name: "Ahmed"),

            NotificationButton(),

            SizedBox(width: 12),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.space36),
              UserAvatar(name: 'Ahmed Mohamed'),
              SizedBox(height: AppSpacing.space20),
              Text(
                'Ahmed Mohamed',
                style: context.theme.textTheme.displayLarge,
              ),
              Text(
                'Software Engineering Student - Level 3',
                style: context.theme.textTheme.bodyMedium,
              ),
              SizedBox(height: AppSpacing.space36),

              //------------------------------------------------------------------
              ProfileMenuTile(
                title: LocaleKeys.profileInfo.tr(),
                iconPath: AppAssets.svgProfile,
              ),
              ProfileMenuTile(
                title: LocaleKeys.myEducationalCertificate.tr(),
                iconPath: AppAssets.svgCertificationIcon,
              ),
              ProfileMenuTile(
                title: LocaleKeys.paymentMethods.tr(),
                iconPath: AppAssets.svgPaymentIcon,
              ),
              ProfileMenuTile(
                title: LocaleKeys.settings.tr(),
                iconPath: AppAssets.svgSettingIcon,
                onTap: () {
                  context.push(Routes.settings);
                },
              ),
              ProfileMenuTile(
                title: LocaleKeys.logOut.tr(),
                iconPath: context.isArabic
                    ? AppAssets.svgLogoutIconEn
                    : AppAssets.svgLogoutIconAr,
              ),
              // ------------------------------------------------------------------
              SizedBox(height: AppSpacing.space32),
              AiAssistantContainer(),
              SizedBox(height: AppSpacing.space45),
            ],
          ),
        ),
      ),
    );
  }
}
