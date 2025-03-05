import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/tables/table_model.dart';
import 'package:restaurant_kot/infrastructure/tables/table_configration.dart';

part 'tables_event.dart';
part 'tables_state.dart';
part 'tables_bloc.freezed.dart';

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
      String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      log('TableData');
      emit(
          state.copyWith(isLoading: true, selectedFloor: null, changed: false));

      try {
        // Fetching table configuration data
        String tableQuery = """
          SELECT TableNumber, TableType, FloorMumber FROM dbo.TableConfiguration
        """;
        List<dynamic> tables = await _fetchData(tableQuery);

        List<TableInfo> tableInfolist =
            (tables).map((data) => TableInfo.fromJson(data)).toList();

        // Extract unique floor numbers from tables
        List<String> floors = tables
            .map((table) => table['FloorMumber'] as String)
            .toSet()
            .toList();

        // Fetching order data for a specific date
        String ordersQuery = """
    SELECT Id, OrderNumber, EntryDate, CustomerId, CustomerName, TableName, FloorNumber, Discount, TotalAmount, StartTime, ActiveInnactive, DineInOrOther, CreditOrPaid, BillNumber, UserID
    FROM dbo.OrderMainDetails
    WHERE CAST(EntryDate AS DATE) = '$currentDate' 
      AND ActiveInnactive = 'Active' 
      AND CreditOrPaid = 'Credit' 
      AND DineInOrOther = 'Dining'
      AND (MergedorNot = 'Merged' OR MergedorNot = '')
""";

        if (demoStatus == true) {
          ordersQuery += " AND UserID = '$usernameA'";
        }

        List<dynamic> orders = await _fetchData(ordersQuery);

        // Convert the fetched data to `TableModel`
        _tableModels = tabeledata(jsonEncode(tables), jsonEncode(orders));

        emit(state.copyWith(
            isLoading: false,
            floors: floors,
            tables: _tableModels,
            tablesinfolist: tableInfolist));
      } catch (e) {
        log("Error fetching table data: $e");
        emit(state.copyWith(isLoading: false));
      }
    });

    // Handle floor selection and table filtering
    on<ChooseFloor>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, selectedFloor: event.floor, changed: false));

      try {
        // Filter and sort tables for the selected floor
        List<TableModel> filteredTables = state.tablesforchange
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

        emit(state.copyWith(isLoading: false, tablesforchange: filteredTables));
      } catch (e) {
        log("Error selecting floor: $e");
        emit(state.copyWith(isLoading: false));
      }
    });

    on<ShowchangeTable>((event, emit) async {
      try {
        // Filter and sort tables for the selected floor
        List<TableModel> tables = _tableModels
            .where((table) => table.tableType == event.tableType)
            .toList();

        emit(state.copyWith(isLoading: false, tablesforchange: tables));
      } catch (e) {
        log("Error selecting floor: $e");
      }
    });

    on<Change>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true, changed: false));

        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String updateQuery = '''
      UPDATE  [dbo].[OrderMainDetails]
      SET TableName = '${event.tablename}'
      WHERE OrderNumber = '${event.orderNo}';
    ''';

        await connection.writeData(updateQuery);

        String itemUpdateQuery = '''
      UPDATE  [dbo].[OrderItemDetailsDetails]
      SET TableName = '${event.tablename}'
      WHERE OrderNumber = '${event.orderNo}';
    ''';

        log(itemUpdateQuery);
        await connection.writeData(itemUpdateQuery);

        emit(state.copyWith(isLoading: false, changed: true));
      } catch (e) {
        emit(state.copyWith(isLoading: false, changed: false));
        log(e.toString());
      }
    });

    on<Select>((event, emit) async {
      emit(state.copyWith(selectedtable: event.tablename));
      // emit(state.copyWith(isLoading: false, changed: false));
    });
  }
}
