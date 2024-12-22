import 'dart:convert';
import 'dart:developer';

import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';

Future<String> fetchAndInsertPayOrExpID(MssqlConnection connection) async {
  logWithTime('_fetchAndInsertPayOrExpID called --------');
  
  // Query to calculate the next PayOrExpID
  String query = '''
    DECLARE @NextPayOrExpID VARCHAR(50);

    INSERT INTO PayorEX (PayOrExpID)
    OUTPUT Inserted.PayOrExpID
    VALUES (
      (
        SELECT ISNULL(
          'PID' + CAST((1 + MAX(CONVERT(INT, RIGHT(PayOrExpID, LEN(PayOrExpID) - 3)))) AS VARCHAR),
          'PID1'
        )
        FROM PayorEX
      )
    )
  ''';

  // Execute the query
  var result = await connection.getData(query);
  logWithTime('_fetchAndInsertPayOrExpID result -------- $result');

  // Validate and parse the result
  if (result == '[]' || result.isEmpty) {
    throw Exception("Failed to insert and fetch PayOrExpID");
  }

  // Decode the result to extract PayOrExpID
  List<dynamic> jsonList = jsonDecode(result);
  return jsonList[0]['PayOrExpID'];
}
