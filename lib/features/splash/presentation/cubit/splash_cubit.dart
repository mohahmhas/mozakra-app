import 'package:e_store/core/constants/cache_keys.dart';
import 'package:e_store/core/enums/startup_status_enums.dart';
import 'package:e_store/core/shared/helpers/cach.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());
  Future<void> checkAuthentication() async {
    final onboardingCompleted = await CacheHelper.getData(
      key: CacheKeys.onboardingCompleted,
    );

    final isOnboardingCompleted = onboardingCompleted == "true";
    if (!isOnboardingCompleted || onboardingCompleted == null) {
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: SplashStatusEnums.onboarding));

      return;
    } else if (isOnboardingCompleted) {
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: SplashStatusEnums.login));
      return;
    }

    emit(state.copyWith(status: SplashStatusEnums.login));
  }
}
