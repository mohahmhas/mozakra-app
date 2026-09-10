import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/features/profile/presentation/widgets/type_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,

    this.imageUrl,

    this.name,

    this.radius = 25,

    this.backgroundColor,

    this.textColor,

    this.onTap,

    this.borderColor,

    this.borderWidth = 0,

    this.assetImage,

    this.isNetworkImage = false,
  });

  final String? imageUrl;

  final String? assetImage;

  final String? name;

  final double radius;

  final Color? backgroundColor;

  final Color? textColor;

  final VoidCallback? onTap;

  final Color? borderColor;

  final double borderWidth;

  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacing.space36,
      height: AppSpacing.space36,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor ?? Colors.red, //AppColors.lightGrey,
                border: borderWidth > 0
                    ? Border.all(
                        color: borderColor ?? context.colorsBorder,

                        width: borderWidth,
                      )
                    : null,
              ),

              child: _hasImage
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightGrey,
                      ),
                      child: isNetworkImage
                          ? Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => _buildInitial(context),
                            )
                          : Image.asset(assetImage!, fit: BoxFit.cover),
                    )
                  : _buildInitial(context),
            ),
          ),
          Positioned(
            top: 90,
            left: AppSpacing.space8,
            right: AppSpacing.space8,
            child: TypeStudent(),
          ),
        ],
      ),
    );
  }

  bool get _hasImage {
    return (imageUrl != null && imageUrl!.isNotEmpty) ||
        (assetImage != null && assetImage!.isNotEmpty);
  }

  Widget _buildInitial(BuildContext context) {
    return Container(
      width: 28.w,
      decoration: BoxDecoration(
        color: context.colorsBorder,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _initialLetter,
          style: context.theme.textTheme.titleMedium?.copyWith(
            color: textColor ?? context.textPrimary,
          ),
        ),
      ),
    );
  }

  String get _initialLetter {
    if (name == null || name!.isEmpty) {
      return '?';
    }

    return name!.trim().characters.first.toUpperCase();
  }
}
