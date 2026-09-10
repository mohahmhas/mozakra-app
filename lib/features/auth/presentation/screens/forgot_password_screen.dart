import 'package:e_store/core/router/routes.dart';
import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_button.dart';
import 'package:e_store/core/shared/widgets/app_text_form_field.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.screen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xxxl),

              const Center(child: TitleApp()),
              const SizedBox(height: AppSpacing.space32),
              Text(
                LocaleKeys.forgotPasswordText.tr(),
                style: AppTextStyles.title18SemiBlod.copyWith(
                  color: context.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.space8),
              AppTextFormField(
                hintText: 'example@email.com',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                borderColor: AppColors.lightGrey,
              ),
              const Spacer(),
              AppButton(
                text: LocaleKeys.verify.tr(),
                onPressed: () {
                  GoRouter.of(context).push(Routes.otp);
                },
              ),
              verticalSpace(AppSpacing.space32),
            ],
          ),
        ),
      ),
    );
  }
}
