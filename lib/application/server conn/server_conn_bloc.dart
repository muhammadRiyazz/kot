import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mssql_connection/mssql_connection.dart';

part 'server_conn_event.dart';
part 'server_conn_state.dart';
part 'server_conn_bloc.freezed.dart';

class ServerConnBloc extends Bloc<ServerConnEvent, ServerConnState> {
  ServerConnBloc() : super(ServerConnState.initial()) {
    on<Passcode>((event, emit) async {
      log('Passcode event initiated');

      emit(state.copyWith(
          isLoading: true, passcode: false, passcodeErrorMsg: null));

      try {
        final response =
            await http.get(Uri.parse('https://www.ballast.in/passcode.txt'));

        if (response.statusCode == 200) {
          if (event.passcodepin == response.body.trim()) {
            log('Correct passcode entered');
            emit(state.copyWith(isLoading: false, passcode: true));
          } else {
            log('Incorrect passcode');
            emit(state.copyWith(
                isLoading: false,
                passcode: false,
                passcodeErrorMsg: 'Incorrect Passcode'));
          }
        } else {
          log('Failed to load passcode data');
          emit(state.copyWith(
              isLoading: false,
              passcode: false,
              passcodeErrorMsg: 'Failed to load passcode'));
        }
      } catch (e) {
        log('Error fetching passcode: $e');
        emit(state.copyWith(
            isLoading: false,
            passcode: false,
            passcodeErrorMsg: 'Error loading passcode data'));
      }
    });

    on<Conn>((event, emit) async {
      log('Connection event initiated');
      emit(state.copyWith(
        isLoading: true,
        conn: false,
        connErrorMsg: null,
        passcode: false,
      ));

      MssqlConnection mssqlConnection = MssqlConnection.getInstance();

      try {
        bool isConnected = await mssqlConnection.connect(
          ip: event.ip,
          port: event.port,
          databaseName: event.databaseName,
          username: event.username,
          password: event.password,
          timeoutInSeconds: 15,
        );

        if (isConnected) {
          log('Connection established successfully');

          // Store connection details in SharedPreferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          Map<String, dynamic> jsonData = {
            "ip": event.ip,
            "port": event.port,
            "databaseName": event.databaseName,
            "username": event.username,
            "password": event.password,
            "timeoutInSeconds": 15,
          };
          await prefs.setString('serverconn', json.encode(jsonData));
          await prefs.setBool('server', true);

          log('Connection details saved: $jsonData');
          emit(state.copyWith(isLoading: false, conn: true));
        } else {
          log('Failed to establish connection');
          emit(state.copyWith(
              isLoading: false,
              conn: false,
              connErrorMsg: 'Failed to connect to server'));
        }
      } catch (e) {
        log('Error during connection attempt: $e');
        emit(state.copyWith(
            isLoading: false,
            conn: false,
            connErrorMsg: 'Failed to connect to server'));
      }
    });
  }
}
