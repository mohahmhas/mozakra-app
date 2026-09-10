import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState());
  Timer? _timer;
  void startTimer() {
    _timer?.cancel();

    emit(state.copyWith(secondsLeft: 60, canResend: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final seconds = state.secondsLeft;

      if (seconds <= 1) {
        timer.cancel();

        emit(state.copyWith(secondsLeft: 0, canResend: true));

        return;
      }

      emit(state.copyWith(secondsLeft: seconds - 1));
    });
  }

  void updateCode(String code) {
    emit(state.copyWith(code: code));
  }

  Future<void> resendOtp() async {
    startTimer();

    // call api
  }

  Future<void> verifyOtp() async {
    // call api
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
