import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<Login>((event, emit) async {
      log('Login event initiated');
      emit(state.copyWith(isLoading: true, errorMsg: null, loged: false));

      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        bool? serverCon = prefs.getBool('server');

        if (serverCon != null && serverCon) {
          MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
          MssqlConnection connection = await connectionManager.getConnection();

          // Prepare and execute the login query
          String query = 'SELECT Id, username, password FROM dbo.login WHERE username = \'${event.username}\' AND password = \'${event.pass}\'';

          log('Executing query: $query'); // Log the query for debugging

          // Get the data
          String result = await connection.getData(query); // Expecting result to be a JSON string
          log('Query result: $result'); // Log the result for debugging

          // Parse the JSON string into a List
          List<dynamic> jsonResponse = jsonDecode(result); // Parse the string to a dynamic list

          if (jsonResponse.isNotEmpty) {
            await prefs.setBool('login', true); // Save login status

            log('Login successful');
            emit(state.copyWith(isLoading: false, loged: true));
          } else {
            log('Invalid username or password');
            emit(state.copyWith(isLoading: false, errorMsg: 'Invalid username or password'));
          }
        } else {
          log('Server Not Connected');
          emit(state.copyWith(isLoading: false, errorMsg: 'Server Not Connected'));
        }
      } catch (e) {
        log('Error during login attempt: $e');
        emit(state.copyWith(isLoading: false));
      }
    });
    on<Logout>((event, emit) async {
      log('Logout event initiated');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('login'); // Clear login status

      log('User logged out');
      emit(state.copyWith(loged: false)); // Update state if needed
    });
  }
}
