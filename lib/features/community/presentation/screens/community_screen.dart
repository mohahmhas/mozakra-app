import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_section_header.dart';
import 'package:e_store/core/shared/widgets/app_text_form_field.dart';
import 'package:e_store/core/shared/widgets/custom_app_bar.dart';
import 'package:e_store/core/shared/widgets/notification_button.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/community/domain/entities/active_group_entity.dart';
import 'package:e_store/features/community/presentation/widgets/active_groups_section.dart';
import 'package:e_store/features/community/presentation/widgets/add_discussion_button.dart';
import 'package:e_store/features/community/presentation/widgets/last_descussion_section.dart';
import 'package:e_store/features/profile/presentation/widgets/user_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,

        title: const TitleApp(),

        actions: const [
          UserAvatar(name: "Ahmed"),

          NotificationButton(),

          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: AppPadding.screen,
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(31),
              AppTextFormField(
                hintText: LocaleKeys.search.tr(),
                borderColor: context.primary,
                prefixIcon: SvgPicture.asset(
                  AppAssets.svgSearch,
                  fit: BoxFit.scaleDown,
                ),
              ),
              verticalSpace(31),
              AppSectionHeader(
                title: LocaleKeys.activeGroups.tr(),
                actionText: LocaleKeys.viewAll.tr(),
              ),
              ActiveGroupsSection(
                activeGroupList: [
                  ActiveGroupEntity(
                    id: '1',
                    titleActivity: 'User interface design',
                    statusActivity: '24 students are currently discussing',
                  ),
                  ActiveGroupEntity(
                    id: '2',
                    titleActivity: 'Python professionals',
                    statusActivity: '15 active students',
                  ),
                  ActiveGroupEntity(
                    id: '3',
                    titleActivity: 'Students Flutter',
                    statusActivity: 'students are currently discussing',
                  ),
                ],
              ),
              verticalSpace(32),
              AppSectionHeader(title: 'Latest discussions'),
              verticalSpace(16),
              LastDescussionSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: AddDiscussionButton(onTap: () {}),
    );
  }
}
