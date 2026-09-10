import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/features/settings/presentation/widgets/setting_card.dart';
import 'package:flutter/material.dart';

class ChangLangMenuTile extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String subTitle;

  const ChangLangMenuTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SettingCard(
                image: AppAssets.svgLocalization,
                color: AppColors.leanerMed,
              ),

              Column(
                children: [
                  Text(title, style: AppTextStyles.bodyLarge),
                  Text(
                    subTitle,
                    style: AppTextStyles.labelMedium.copyWith(
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.lightGrey),
        ],
      ),
    );
  }
}
