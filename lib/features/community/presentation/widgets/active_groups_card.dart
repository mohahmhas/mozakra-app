import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/community/domain/entities/active_group_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveGroupsCard extends StatelessWidget {
  final ActiveGroupEntity activeGroupEntity;
  const ActiveGroupsCard({super.key, required this.activeGroupEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256.w,
      height: 144.h,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),

      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(AppRadius.radius24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: Offset(0, 10),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppAssets.svgCooperatingIcon,
            colorFilter: ColorFilter.mode(context.onSurface, BlendMode.srcIn),
            width: 30,
          ),
          verticalSpace(20),
          Text(
            activeGroupEntity.titleActivity,
            style: AppTextStyles.title18SemiBlod.copyWith(
              color: context.onSurface,
            ),
          ),
          verticalSpace(4),

          Text(
            activeGroupEntity.statusActivity,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
