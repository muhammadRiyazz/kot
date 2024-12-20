import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';

part 'printer_setup_event.dart';
part 'printer_setup_state.dart';
part 'printer_setup_bloc.freezed.dart';

class PrinterSetupBloc extends Bloc<PrinterSetupEvent, PrinterSetupState> {
  PrinterSetupBloc() : super(PrinterSetupState.initial()) {
    on<FetchKitchens>((event, emit) async {
      emit(state.copyWith(isLoading: true, updated: 0));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String kitchenNameQuery = """
  SELECT [KitchenName]
          FROM  [dbo].[KitchenNames];
           """;
        String? kitchenNameresult = await connection.getData(kitchenNameQuery);
        log(kitchenNameresult);

// Decode the JSON response
        List<dynamic> kitchenNameresultjson = jsonDecode(kitchenNameresult);

// Extract the "KitchenName" from each entry in the list
        List<String> kitchenNames = kitchenNameresultjson
            .map((item) => item['KitchenName'] as String)
            .toList();

        emit(state.copyWith(
          isLoading: false,
          kitchenlist: kitchenNames,
        ));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(
          isLoading: false,
        ));
      }
    });

    on<FetchPrinter>((event, emit) async {
      emit(state.copyWith(isLoading: true, updated: 0));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String getPrintersQuery = '''
    SELECT [PrinterName], [KitchenName], [ComputerName]
    FROM  [dbo].[KitchenPrinterConfig]
    WHERE ComputerName ='Mob-II01' 
''';

        String? result = await connection.getData(getPrintersQuery);
        log(result);
        List<dynamic> jsonList =
            json.decode(result); // Decode JSON string to List

        // Map the list to PrinterConfig objects
        List<PrinterConfig> printers = jsonList
            .map((jsonItem) => PrinterConfig.fromJson(jsonItem))
            .toList();
        PrinterConfig? printerinfo;
        PrinterConfig? billPrinterInfo;

        if (result == '[]') {
          emit(state.copyWith(
            isLoading: false,
          ));
        } else {
          log('result==not emty');
          if (event.kitchen != null) {
            log('----- opo');
            for (var element in printers) {
              if (element.kitchenName == event.kitchen) {
                printerinfo = element;
              }
            }
          }
          log('----- 0000');

          for (var element in printers) {
            if (element.kitchenName == 'Bill' &&
                element.computerName == 'Mob-II01') {
              billPrinterInfo = element;
            }
          }
          log('----- 9900');

          emit(state.copyWith(
              isLoading: false,
              priterlist: printers,
              priterinfo: printerinfo,
              billPrinterInfo: billPrinterInfo));
        }
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(
          isLoading: false,
        ));
      }
    });

    on<FetchkitchenPrinter>((event, emit) async {
      try {
        PrinterConfig? printerinfo;
        if (state.priterlist != null) {
          for (var element in state.priterlist!) {
            log('------${event.kitchen}');

            log(element.kitchenName);
            if (element.kitchenName == event.kitchen &&
                element.computerName == 'Mob-II01') {
              log('------${event.kitchen}');
              printerinfo = element;
            }
          }
        }

        emit(state.copyWith(priterinfo: printerinfo, updated: 0));
      } catch (e) {
        log(e.toString());
      }
    });

    on<AddPrinter>((event, emit) async {
      emit(state.copyWith(isLoading: true, updated: 0));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String addQuery = '''
       MERGE INTO  [dbo].[KitchenPrinterConfig] AS target
       USING (SELECT 'Mob-II01' AS ComputerName, '${event.kitchen}' AS KitchenName, '${event.ip}' AS PrinterName) AS source
      ON target.ComputerName = source.ComputerName AND target.KitchenName = source.KitchenName
    WHEN MATCHED THEN
        UPDATE SET target.PrinterName = source.PrinterName
    WHEN NOT MATCHED THEN
        INSERT (ComputerName, KitchenName, PrinterName)
        VALUES (source.ComputerName, source.KitchenName, source.PrinterName);
''';

        String? result = await connection.writeData(addQuery);
        log(result);

        emit(state.copyWith(isLoading: false, updated: 1));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(
          isLoading: false,
        ));
      }
    });
  }
}
