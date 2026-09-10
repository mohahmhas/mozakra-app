import 'package:e_store/core/facke_data.dart';
import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/shared/helpers/font_weight_helper.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/app/presentation/logic/cubit_localization/localization_cubit.dart';
import 'package:e_store/features/settings/data/model/language_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        return Padding(
          padding: AppPadding.bottomSheet,
          child: BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40.w,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  verticalSpace(24),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.chooseLanguage.tr(),
                        style: AppTextStyles.title22SemiBlodColorDarkWhite,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => GoRouter.of(context).pop(),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  ...languagesList.map(
                    (e) => _ItemCardLang(
                      stateBloc: state,
                      item: e,
                      onTap: () {
                        context.read<LocalizationCubit>().changeLanguage(
                          context,
                          e.code,
                        );
                        GoRouter.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _ItemCardLang extends StatelessWidget {
  final Function() onTap;
  final LanguageItem item;
  final LocalizationState stateBloc;
  const _ItemCardLang({
    required this.item,
    required this.onTap,
    required this.stateBloc,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 8, right: 24, left: 24, bottom: 16),
        width: double.infinity,
        height: 76.h,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(AppRadius.radius16),
          border: Border.all(color: AppColors.leanerEnd),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Text(
                      item.name.substring(0, 1),
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.leanerEnd,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  ),
                ),
                horizontalSpace(16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                    Text(
                      item.flag,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            stateBloc.locale.languageCode == item.code
                ? const Icon(Icons.check, color: AppColors.leanerEnd)
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
