import 'dart:convert';
import 'dart:developer';

import 'package:mssql_connection/mssql_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MSSQLConnectionManager {
  static final MSSQLConnectionManager _instance =
      MSSQLConnectionManager._internal();
  MssqlConnection? _connection;

  factory MSSQLConnectionManager() {
    return _instance;
  }

  MSSQLConnectionManager._internal();

  Future<MssqlConnection> getConnection() async {
    if (_connection == null || !_connection!.isConnected) {
      // Reconnect using saved credentials
      await reconnect();
    }
    return _connection!;
  }

  Future<void> reconnect() async {
    log('reconnection --');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? serverData = prefs.getString('serverconn');

    if (serverData != null) {
      Map<String, dynamic> connectionDetails = json.decode(serverData);

      _connection = MssqlConnection.getInstance();
      await _connection!.connect(
        ip: connectionDetails['ip'],
        port: connectionDetails['port'],
        databaseName: connectionDetails['databaseName'],
        username: connectionDetails['username'],
        password: connectionDetails['password'],
        timeoutInSeconds: connectionDetails['timeoutInSeconds'],
      );
    }
  }

  Future<void> disconnect() async {
    if (_connection != null && _connection!.isConnected) {
      await _connection!.disconnect();
      _connection = null;
    }
  }
}
