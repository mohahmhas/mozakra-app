import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/achievements/domain/entities/certificate_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificateCard extends StatelessWidget {
  final CertificateEntity certificate;

  const CertificateCard({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 316.h,
      child: Container(
        width: 300.w,
        height: 292.h,
        margin: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(50), offset: Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 298.w,
              height: 192.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(certificate.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpace(24),
            Text(
              certificate.title,
              style: AppTextStyles.title18SemiBlod.copyWith(
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              certificate.date,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
