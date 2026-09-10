import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:flutter/material.dart';

class SettingSectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const SettingSectionCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title14SemiBlod.copyWith(
            color: AppColors.leanerEnd,
            fontWeight: FontWeightHelper.bold,
          ),
        ),

        verticalSpace(12),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.radius20),
            color: Theme.of(context).cardColor,
          ),
          child: child,
        ),
      ],
    );
  
  }
}
