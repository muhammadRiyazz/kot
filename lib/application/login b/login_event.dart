part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login({required String pass, required String username}) = Login;
    const factory LoginEvent.logout() = Logout; 

}