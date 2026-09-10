import 'package:e_store/features/onboarding_completed/data/onboarding_item.dart';
import 'package:e_store/features/onboarding_completed/presentation/cubit/onboarding_cubit.dart';
import 'package:e_store/features/onboarding_completed/presentation/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,

      child: PageView.builder(
        controller: context.read<OnboardingCubit>().pageController,
        onPageChanged: context.read<OnboardingCubit>().onPageChanged,
        itemCount: onboardingItems.length,
        itemBuilder: (context, index) {
          return OnboardingPageView(onboardingItem: onboardingItems[index]);
        },
      ),
    );
  }
}
