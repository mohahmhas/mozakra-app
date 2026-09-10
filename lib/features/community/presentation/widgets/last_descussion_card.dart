import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/community/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:timeago/timeago.dart' as timeago;

class LastDescussionCard extends StatelessWidget {
  final PostEntity postEntity;
  const LastDescussionCard({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.radius24),
        border: Border.all(width: 0.5, color: AppColors.grey),
        color: context.surface,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 28,
                child: Text('A', textAlign: TextAlign.center),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postEntity.author.name,
                    style: AppTextStyles.title18SemiBlod.copyWith(
                      color: context.textPrimary,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: postEntity.createdAt.timeAgo(
                        locale: context.isArabic ? 'ar' : 'en',
                      ), // '2 hours ago • In ',
                      style: AppTextStyles.bodyMedium,
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' ${postEntity.groupName}',
                          style: AppTextStyles.title14SemiBlod.copyWith(
                            color: AppColors.leanerEnd,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(AppAssets.svgDotmenu),
            ],
          ),
          SizedBox(
            height: 104.h,
            width: double.infinity,
            child: Text(
              postEntity.post,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Sharing', style: AppTextStyles.bodyMedium),
                  horizontalSpace(4),
                  SvgPicture.asset(AppAssets.svgShareIcon),
                ],
              ),
              Row(
                children: [
                  Text(
                    postEntity.commentsCount.toString(),
                    style: AppTextStyles.bodyMedium,
                  ),
                  horizontalSpace(4),
                  SvgPicture.asset(AppAssets.svgMassage),
                  horizontalSpace(8),
                  Text(
                    postEntity.likesCount.toString(),
                    style: AppTextStyles.bodyMedium,
                  ),
                  horizontalSpace(4),
                  SvgPicture.asset(AppAssets.svgLike),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
