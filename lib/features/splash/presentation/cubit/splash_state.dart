part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final SplashStatusEnums status;
  const SplashState({this.status = SplashStatusEnums.initial});

  SplashState copyWith({SplashStatusEnums? status}) {
    return SplashState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
