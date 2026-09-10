part of 'otp_cubit.dart';

class OtpState extends Equatable {
  final String code;
  final int secondsLeft;
  final bool canResend;
  final bool isLoading;

  const OtpState({
    this.code = '',
    this.secondsLeft = 60,
    this.canResend = false,
    this.isLoading = false,
  });

  bool get isValid => code.length == 6;

  OtpState copyWith({
    String? code,
    int? secondsLeft,
    bool? canResend,
    bool? isLoading,
  }) {
    return OtpState(
      code: code ?? this.code,
      secondsLeft: secondsLeft ?? this.secondsLeft,
      canResend: canResend ?? this.canResend,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [code, secondsLeft, canResend, isLoading];
}
