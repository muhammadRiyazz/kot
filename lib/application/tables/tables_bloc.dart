import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/tables/table_model.dart';
import 'package:restaurant_kot/infrastructure/tables/table_configration.dart';

part 'tables_event.dart';
part 'tables_state.dart';
part 'tables_bloc.freezed.dart';

// class TablesBloc extends Bloc<TablesEvent, TablesState> {
//   TablesBloc() : super(TablesState.initial()) {
//     List<TableModel> tableModels = [];
//     on<TableData>((event, emit) async {
//       emit(state.copyWith(isLoading: true, selectedFloor: null));

//       try {
//         MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
//         MssqlConnection connection = await connectionManager.getConnection();

//         // Fetching the table configuration data
//         String query =
//             "SELECT TableNumber, TableType, FloorMumber FROM dbo.TableConfiguration";
//         String? totaltableresult = await connection.getData(query);
//         // log(totaltableresult);

//         // Check if the table result is empty
//         if (totaltableresult.isEmpty) {
//           throw Exception("Table configuration data not found.");
//         }

//         List<dynamic> tables = jsonDecode(totaltableresult);

//         // Extract the list of floors and remove duplicates
//         List<String> floors = tables
//             .map((table) => table['FloorMumber'] as String)
//             .toSet()
//             .toList();

//         // Fetching the order data for a specific date
//         String ordersquery =
//             "SELECT Id, OrderNumber, EntryDate, UserName, CustomerId, CustomerName, TableName, FloorNumber, TaxableAmount, Discount, TotalAmount, StartDateTime, ActiveInnactive, DineInOrOther, CreditOrPaid, BillNumber, paidornot, UserID "
//             "FROM dbo.OrderMainDetails "
//             "WHERE EntryDate = '2024-09-10 00:00:00.000'";
//         // AND ActiveInnactive = 'Active'
//         String? ordersresult = await connection.getData(ordersquery);
//         // log(ordersresult);

//         // Check if the orders result is empty
//         if (ordersresult.isEmpty) {
//           throw Exception("Order data not found.");
//         }

//         // Parsing and converting the data to TableModel
//         tableModels = tabeledata(totaltableresult, ordersresult);

//         // Emit state with tableModels data
//         emit(state.copyWith(
//             isLoading: false, floors: floors, tables: tableModels));
//       } catch (e) {
//         emit(state.copyWith(isLoading: false));
//         log(e.toString());
//       }
//     });

//     on<ChooseFloor>((event, emit) async {
//       emit(state.copyWith(isLoading: true, selectedFloor: event.floor));

//       try {
//         // Get the current tables list
//         List<TableModel> currentTables = tableModels;

//         // Filter tables based on the selected floor
//         List<TableModel> filteredTables = currentTables
//             .where((table) => table.floorName == event.floor)
//             .toList();

//         // Sort tables: non-empty tables first, empty tables last
//         filteredTables.sort((a, b) {
//           if (a.isEmpty && !b.isEmpty) {
//             return 1; // Empty tables go last
//           } else if (!a.isEmpty && b.isEmpty) {
//             return -1; // Non-empty tables go first
//           } else {
//             return 0; // Keep relative order if both are the same
//           }
//         });

//         // Emit the filtered and sorted tables for the selected floor
//         emit(state.copyWith(isLoading: false, tables: filteredTables));
//       } catch (e) {
//         emit(state.copyWith(isLoading: false));
//         log(e.toString());
//       }
//     });
//   }
// }

class TablesBloc extends Bloc<TablesEvent, TablesState> {
  List<TableModel> _tableModels = []; // Cached list for table models

  TablesBloc() : super(TablesState.initial()) {
    // Helper function for database queries
    Future<List<dynamic>> _fetchData(String query) async {
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String? result = await connection.getData(query);

        if (result.isEmpty) {
          throw Exception("No data found for query: $query");
        }

        return jsonDecode(result);
      } catch (e) {
        log("Database query failed ---: $e");
        throw Exception("Failed to fetch data");
      }
    }

    // Fetch table configuration and orders
    on<TableData>((event, emit) async {
      log('TableData');
      emit(state.copyWith(isLoading: true, selectedFloor: null));

      try {
        // Fetching table configuration data
        String tableQuery = """
          SELECT TableNumber, TableType, FloorMumber FROM dbo.TableConfiguration
        """;
        List<dynamic> tables = await _fetchData(tableQuery);

        // Extract unique floor numbers from tables
        List<String> floors = tables
            .map((table) => table['FloorMumber'] as String)
            .toSet()
            .toList();

        // Fetching order data for a specific date
      String ordersQuery = """
  SELECT Id, OrderNumber, EntryDate, CustomerId, CustomerName, TableName, FloorNumber, Discount, TotalAmount, StartTime, ActiveInnactive, DineInOrOther, CreditOrPaid, BillNumber, UserID
  FROM dbo.OrderMainDetails
  WHERE CAST(EntryDate AS DATE) = '2024-10-23' AND ActiveInnactive = 'Active'
""";

        List<dynamic> orders = await _fetchData(ordersQuery);

        // Convert the fetched data to `TableModel`
        _tableModels = tabeledata(jsonEncode(tables), jsonEncode(orders));

        emit(state.copyWith(
          isLoading: false,
          floors: floors,
          tables: _tableModels,
        ));
      } catch (e) {
        log("Error fetching table data: $e");
        emit(state.copyWith(isLoading: false));
      }
    });

    // Handle floor selection and table filtering
    on<ChooseFloor>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedFloor: event.floor));

      try {
        // Filter and sort tables for the selected floor
        List<TableModel> filteredTables = _tableModels
            .where((table) => table.floorName == event.floor)
            .toList();

        filteredTables.sort((a, b) {
          if (a.isEmpty && !b.isEmpty) {
            return 1; // Empty tables go last
          } else if (!a.isEmpty && b.isEmpty) {
            return -1; // Non-empty tables go first
          } else {
            return 0; // Maintain order for same status
          }
        });

        emit(state.copyWith(isLoading: false, tables: filteredTables));
      } catch (e) {
        log("Error selecting floor: $e");
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
