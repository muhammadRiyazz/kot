part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool isLoading,
    String? errorMsg,
    required bool loged,
    bool? uservalid,
  }) = _LoginState;
  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      errorMsg: null,uservalid: true,
      loged: false,
    );
  }
}
