import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TypeStudent extends StatelessWidget {
  const TypeStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space8,
        vertical: AppSpacing.space4,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: const LinearGradient(
          colors: [AppColors.leanerEnd, AppColors.leanerMed],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.radius20),
        border: Border.all(color: AppColors.white, width: AppRadius.radius3),
      ),
      child: Center(
        child: Row(
          children: [
            ClipOval(
              child: Container(
                width: AppSpacing.space13,
                height: AppSpacing.space13,
                color: AppColors.white,
                child: const Center(
                  child: Icon(
                    Icons.star,
                    color: AppColors.leanerEnd,
                    size: AppSpacing.space10,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSpacing.space4),
            Text('Premium\nStudent', style: AppTextStyles.title12SemiBlod),
          ],
        ),
      ),
    );
  }
}
