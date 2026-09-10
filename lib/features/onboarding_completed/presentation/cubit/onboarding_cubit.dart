import 'package:e_store/core/constants/cache_keys.dart';
import 'package:e_store/core/shared/helpers/cach.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  PageController pageController = PageController();

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  Future<void> nextPage() async {
    if (state.currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      emit(state.copyWith(isCompleted: true));
      await CacheHelper.saveData(
        key: CacheKeys.onboardingCompleted,
        value: state.isCompleted.toString(),
      );
    }
  }

  Future<void> skip() async {
   
    emit(state.copyWith(isCompleted: true));
     await CacheHelper.saveData(
      key: CacheKeys.onboardingCompleted,
      value: state.isCompleted.toString(),
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
