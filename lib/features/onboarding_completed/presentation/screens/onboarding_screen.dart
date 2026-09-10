import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/router/routes.dart';
import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/shared/widgets/app_button.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/onboarding_completed/presentation/cubit/onboarding_cubit.dart';
import 'package:e_store/features/onboarding_completed/presentation/widgets/dots_indicator.dart';
import 'package:e_store/features/onboarding_completed/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (state.isCompleted) {
              debugPrint("completed : ${state.isCompleted}");
              GoRouter.of(context).pushReplacement(Routes.login);
            }
          },
          child: Column(
            children: [
              verticalSpace(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<OnboardingCubit>().skip();
                      },
                      child: Text("Skip", style: AppTextStyles.bodyMedium),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text("Muzakara", style: AppTextStyles.title18SemiBlod),
                        horizontalSpace(8),
                        SvgPicture.asset(AppAssets.svgMiniIconApp),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    OnboardingPage(),

                    //i want create three dots
                    DotsIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AppButton(
            text: "Next",
            onPressed: () {
              context.read<OnboardingCubit>().nextPage();
            },
          ),
        ),
      ),
    );
  }
}
