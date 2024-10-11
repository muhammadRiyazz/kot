part of 'server_conn_bloc.dart';

@freezed
class ServerConnEvent with _$ServerConnEvent {
  const factory ServerConnEvent.passcode({
    required String passcodepin,
  }) = Passcode;
  const factory ServerConnEvent.conn({
    required String ip,
    required String port,
    required String databaseName,
    required String username,
    required String password,
  }) = Conn;
  }