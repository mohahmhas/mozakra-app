import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shared/helpers/font_weight_helper.dart';
import 'tokens/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final base = GoogleFonts.cairo(height: 1.4);

  static final displayLarge = base.copyWith(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static final title28Blod = base.copyWith(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final headlineLarge = base.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static final titleMedium = base.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static final bodyLarge = base.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static final title16SemiBlod = base.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final bodyMedium = base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static final labelMedium = base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final title12SemiBlod = base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
  static final title12BlodWhite = base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white,
  );

  static final title18SemiBlod = base.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static final title18BlodWhite = base.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white,
  );
  static final title12Blod = base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static final title24SemiBlod = base.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
  static final title14SemiBlod = base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final title22SemiBlodColorDarkWhite = base.copyWith(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.darkWhite,
  );
}
