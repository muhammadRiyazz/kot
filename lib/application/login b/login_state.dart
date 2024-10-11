part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool isLoading,
    String? errorMsg,
    required bool loged,

  }) = _LoginState;
  factory LoginState.initial() {
    return LoginState(isLoading: false, errorMsg: null,loged: false);
  }
}
