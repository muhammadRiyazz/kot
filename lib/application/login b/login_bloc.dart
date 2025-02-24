import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<Login>((event, emit) async {
      log('Login event initiated');
      emit(state.copyWith(
          isLoading: true, errorMsg: null, loged: false, uservalid: true));

      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        bool? serverCon = prefs.getBool('server');
        if (serverCon != null && serverCon) {
          MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
          MssqlConnection connection = await connectionManager.getConnection();

          String query1 = "SELECT invtmplt FROM dbo.Settings";
          String? result1 = await connection.getData(query1);
          log(query1);

          if (checkDateValidity(result1)) {
            String query =
                'SELECT Id, username, password, role FROM dbo.login WHERE username = \'${event.username}\' AND password = \'${event.pass}\'';

            log('Executing query: $query'); // Log the query for debugging

            // Get the data
            String result = await connection
                .getData(query); // Expecting result to be a JSON string
            log('Query result: $result'); // Log the result for debugging

            // Parse the JSON string into a List
            List<dynamic> jsonResponse =
                jsonDecode(result); // Parse the string to a dynamic list

            if (jsonResponse.isNotEmpty) {
              await prefs.setBool('login', true); // Save login status
              await prefs.setString(
                  'userID', jsonResponse[0]['username']); // Save login status
              usernameA = jsonResponse[0]['username'];
              String roles = jsonResponse[0]['role'].toString();
              String targetRole = "B1";
              String billRole = "X1";

              // Check if the target role is included in the roles string
              bool billEditt = roles.split(',').contains(targetRole);
              bool addbillrole = roles.split(',').contains(billRole);

              await prefs.setBool('billEdit', billEditt); // Save login status
              await prefs.setBool('addbill', addbillrole); // Save login status

              billEdit = billEditt;
              addBill = addbillrole;
              log('Login successful');
              emit(state.copyWith(
                  isLoading: false,
                  loged: true,
                  userId: jsonResponse[0]['username']));
            } else {
              log('Invalid username or password');
              emit(state.copyWith(
                  isLoading: false, errorMsg: 'Invalid username or password'));
            }
          } else {
            log('user not valid');
            emit(state.copyWith(
                isLoading: false,
                uservalid: false,
                errorMsg: 'Please Check Your Payment Status'));
          }
        } else {
          log('Server Not Connected');
          emit(state.copyWith(
              isLoading: false, errorMsg: 'Server Not Connected'));
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
    on<FetchLogin>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString('userID');
      bool? billEditt = prefs.getBool('billEdit'); // Save login status
      bool? addbillp = prefs.getBool('addbill'); // Save login status

      // Clear login status
      usernameA = userid;

      billEdit = billEditt;
      addBill = addbillp;
      emit(state.copyWith(userId: userid)); // Update state if needed
    });
  }
}

checkDateValidity(String result) {
  var decodedJson = jsonDecode(result);
  String data = decodedJson[0]['invtmplt'];
  bool valid = false;
  // Define the format of the date from the database (in your case: "dd/MM/yyyy hh:mm:ss a")
  DateFormat format = DateFormat("dd/MM/yyyy hh:mm:ss a");

  try {
    // Parse the date from the database
    DateTime dbDate = format.parse(data);

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Compare the dates
    if (dbDate.isAfter(currentDate)) {
      valid = true;
      log("The date from the database is after the current date.");
    } else if (dbDate.isBefore(currentDate)) {
      valid = false;
      log("The date from the database is before the current date.");
    } else {
      valid = true;

      log("The date from the database is the same as the current date.");
    }
  } catch (e) {
    log("Error parsing date: $e");
  }

  return valid;
}
