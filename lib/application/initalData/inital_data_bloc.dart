import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';

part 'inital_data_event.dart';
part 'inital_data_state.dart';
part 'inital_data_bloc.freezed.dart';

class InitalDataBloc extends Bloc<InitalDataEvent, InitalDataState> {
  InitalDataBloc() : super(const InitalDataState.initial()) {
    on<Addinitaldatas>((event, emit) async {
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String query1 = "SELECT taxtype FROM dbo.Settings";
        String? result1 = await connection.getData(query1);
        log('$result1 ------------------');
        var decodedJson = jsonDecode(result1);
        String data = decodedJson[0]['taxtype'];
        if (data == 'SaleExclusive') {
          TaxtypeMng().addTaxtype(value: false);
        } else {
          TaxtypeMng().addTaxtype(value: true);
        }
      } catch (e) {
        log(e.toString());
      }
    });

    on<Fetchinitaldatas>((event, emit) async {
      try {
        TaxtypeMng().fetchtaxtype();
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
