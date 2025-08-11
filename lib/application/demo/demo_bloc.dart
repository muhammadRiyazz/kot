import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/infrastructure/get_time.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'demo_event.dart';
part 'demo_state.dart';
part 'demo_bloc.freezed.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoState.initial()) {
    on<Demodatabase>((event, emit) async {
      emit(state.copyWith(isLoading: true, loged: false));

      try {
        final Response response;
        if (event.type == 'Non-Veg Restaurant') {
          response = await http.get(Uri.parse(
              'https://www.ballast.in/Restaurant/RestaurantVegNonVeg.txt'));
        } else {
          response = await http.get(
              Uri.parse('https://www.ballast.in/Restaurant/RestaurantVeg.txt'));
        }

        if (response.statusCode == 200) {
          final responseBody = response.body;
          log(responseBody);

          // Parse the response body to extract connection details
          final lines = responseBody.split('\n');
          final ip = lines[0].trim();
          final databaseName = lines[1].trim();
          final username = lines[2].trim();
          final password = lines[3].trim();
          final port = lines[4].trim();
          // final lusername = lines[5].trim();
          // final lpassword = lines[6].trim();

          // Connect to the MSSQL database
          MssqlConnection mssqlConnection = MssqlConnection.getInstance();
          bool isConnected = await mssqlConnection.connect(
            ip: ip,
            port: port,
            databaseName: databaseName,
            username: username,
            password: password,
            timeoutInSeconds: 15,
          );

          if (isConnected) {
            // Store connection details in SharedPreferences
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            Map<String, dynamic> jsonData = {
              "ip": ip,
              "port": port,
              "databaseName": databaseName,
              "username": username,
              "password": password,
              "timeoutInSeconds": 15,
            };
            await prefs.setString('serverconn', json.encode(jsonData));
            await prefs.setBool('server', true);
            ipid = ip;

            log('Connected to the database successfully');

            bool exists =
                await isUsernameExists(mssqlConnection, event.phoneNo!);

            if (exists) {
              log("Username already exists");
            } else {
              var formattedDate = getDateTime();

              String demoInsertQuery = '''
INSERT INTO [dbo].[CustomerOnlineRegister] (
    CustomerName, Address, State, Contact, Invoicedate
) VALUES (
    '${event.name}', '${event.address}', '${event.state}', '${event.phoneNo}', '$formattedDate'
    
)
''';
              String loginInsertQuery = '''
INSERT INTO [dbo].[login] (
    username, password, role
) VALUES (
    '${event.phoneNo}', '${event.phoneNo}', 'A1,B1,C1,D1,E1,F1,G1,H1,I1,J1,K1,L1,M1,N1,O1,P1,Q1,R1,X1,S1,T1'
    
)
''';
              await mssqlConnection.writeData(demoInsertQuery);

              await mssqlConnection.writeData(loginInsertQuery);

              log("Username is available");
            }

            String query =
                'SELECT Id, username, password, role FROM dbo.login WHERE username = \'${event.phoneNo}\' AND password = \'${event.phoneNo}\'';

            log('Executing query: $query'); // Log the query for debugging

            // Get the data
            String result = await mssqlConnection
                .getData(query); // Expecting result to be a JSON string
            log('Query result: $result'); // Log the result for debugging

            // Parse the JSON string into a List
            List<dynamic> jsonResponse =
                jsonDecode(result); // Parse the string to a dynamic list

            await prefs.setBool('login', true); // Save login status
            await prefs.setString(
                'userID', jsonResponse[0]['username']); // Save login status
            usernameA = jsonResponse[0]['username'];
            String roles = jsonResponse[0]['role'].toString();
            String targetRole = "X1";
            String billRole = "B1";

            // Save login status
            // Check if the target role is included in the roles string
            bool billEditt = roles.split(',').contains(targetRole);
            bool addbillrole = roles.split(',').contains(billRole);

            await prefs.setBool('billEdit', billEditt); // Save login status
            await prefs.setBool('addbill', addbillrole); // Save login status

            billEdit = billEditt;
            addBill = addbillrole;
            log('Login successful');
            if (event.exist) {
              log('demonottttttstored ---------');
            } else {
              log('demostored ---------');
              await prefs.setBool('demostatus', true);

              await prefs.setString('demo', event.type!);
              await prefs.setString('username', event.phoneNo!);
              demoStatus = true;
              demousername = event.type!;
              demoutype = event.phoneNo!;
            }

            emit(state.copyWith(isLoading: false, loged: true));
          } else {
            emit(state.copyWith(
              isLoading: false,
            ));

            log('Failed to connect to the database');
          }
        } else {
          emit(state.copyWith(
            isLoading: false,
          ));

          log('Failed to fetch data: ${response.statusCode}');
        }
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
        ));

        log(e.toString());
      }
    });

    on<FetchDemo>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String? demoty = prefs.getString('demo');
      String? demouser = prefs.getString('username');

      demoStatus = prefs.getBool('demostatus');

      demousername = demouser;
      demoutype = demoty;
    });
  }
}

Future<bool> isUsernameExists(
    MssqlConnection connection, String username) async {
  try {
    log('---------isUsernameExists');

    // Correct parameterized query
    String query =
        "SELECT COUNT(*) as count FROM dbo.login WHERE username = '$username'";

    // Execute the query with parameters
    final result = await connection.getData(query);

    log(result);
    List<dynamic> jsonResponse =
        jsonDecode(result); // Parse the string to a dynamic list

    // Check if any row is returned and count > 0
    return jsonResponse.isNotEmpty && jsonResponse[0]["count"] > 0;
  } catch (e) {
    log("Error checking username: $e");
    return false; // Handle errors gracefully
  }
}
