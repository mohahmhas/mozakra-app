import 'package:e_store/core/network/network_exception.dart';
import 'package:e_store/features/auth/domain/entities/user_entity.dart';
import 'package:e_store/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final user = await _loginUseCase.call(email: email, password: password);
      emit(LoginSuccess(user: user));
    } on NetworkException catch (exception) {
      emit(LoginFailure(message: exception.message));
    } catch (_) {
      emit(
        const LoginFailure(message: 'Something went wrong. Please try again.'),
      );
    }
  }
}
