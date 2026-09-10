import 'package:e_store/core/shared/helpers/app_padding.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_button.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:e_store/features/otp/presentation/widgets/otp_input_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.xxxl),

            TitleApp(),

            SizedBox(height: 24),

            Text(LocaleKeys.verify.tr()),

            SizedBox(height: 8),
            OtpPinField(
              controller: PinInputController(),
              onChanged: (value) => debugPrint(value),
              onCompleted: (value) => debugPrint("is completed value:$value"),
            ),
            verticalSpace(25),
            BlocBuilder<OtpCubit, OtpState>(
              buildWhen: (p, c) =>
                  p.secondsLeft != c.secondsLeft || p.canResend != c.canResend,
              builder: (context, state) {

                return TextButton(
                  onPressed: state.canResend
                      ? () {
                          context.read<OtpCubit>().resendOtp();
                        }
                      : null,
                  child: Text(
                    state.canResend ? 'Resend Code' : '${state.secondsLeft}S',
                  ),
                );
              },
            ),

            const Spacer(),
            BlocBuilder<OtpCubit, OtpState>(
              buildWhen: (previous, current) =>
                  previous.code != current.code ||
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                return AppButton(
                  text: LocaleKeys.verify.tr(),
                  onPressed: () {
                    // GoRouter.of(context).push(Routes.otp);
                    context.read<OtpCubit>().verifyOtp();
                  },
                );
              },
            ),
            verticalSpace(AppSpacing.space32),
          ],
        ),
      ),
    );
  }
}
