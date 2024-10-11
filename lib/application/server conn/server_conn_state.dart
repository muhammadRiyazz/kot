part of 'server_conn_bloc.dart';

@freezed
class ServerConnState with _$ServerConnState {
  factory ServerConnState({
    required bool isLoading,
    required bool passcode,
    required bool conn,
    String? passcodeErrorMsg,
    String? connErrorMsg,
  }) = _ServerConnState;
  factory ServerConnState.initial() {
    return ServerConnState(conn: false,
        isLoading: false,
        passcode: false,
        passcodeErrorMsg: null,
        connErrorMsg: null);
  }
}
