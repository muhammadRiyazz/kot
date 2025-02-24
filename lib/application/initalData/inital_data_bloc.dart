import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/resto%20info/hotel_info.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';
import 'package:restaurant_kot/infrastructure/next%20id/appentydata.dart';

part 'inital_data_event.dart';
part 'inital_data_state.dart';
part 'inital_data_bloc.freezed.dart';

class InitalDataBloc extends Bloc<InitalDataEvent, InitalDataState> {
  InitalDataBloc() : super(InitalDataState.initial()) {
    on<Addinitaldatas>((event, emit) async {
      emit(state.copyWith(isloading: true));

      log('Addinitaldatas--pppppp');
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String query1 =
            "SELECT taxtype,cmpname,cmpadd,taxtype,cmpgstno,CompanyContactNo,BillFooterText,KOTFooterText FROM dbo.Settings";
        String? result1 = await connection.getData(query1);
        log(' ------------------$result1');
        // var decodedJson = jsonDecode(result1);
        List<dynamic> jsonResponse = json.decode(result1);

        // Map the JSON to a list of Settings objects
        List<Settings> settingsList = jsonResponse.map((data) {
          return Settings.fromJson(data);
        }).toList();

        String data = settingsList[0].taxtype;
        if (data == 'SaleExclusive') {
          TaxtypeMng().addTaxtype(value: false);
        } else {
          TaxtypeMng().addTaxtype(value: true);
        }
        infoCustomer = settingsList[0];
        emit(state.copyWith(settingsData: settingsList[0], isloading: false));
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
    on<FetchPaymentType>((event, emit) async {
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String query = "SELECT PaymentMethod  FROM dbo.PaymentMethod GO";

        String result = await connection.getData(query);
        log(result);
        List<String> paymentMethods = extractPaymentMethods(result);

        emit(state.copyWith(paymentType: paymentMethods));
      } catch (e) {
        log("Error from report bloc (FetchTotalSaleReports) : $e");
      }
    });

    on<FetchAppEnty>((event, emit) async {
      log('FetchAppEnty-------');
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
// Assuming your connection returns data in JSON format as a string
        String qry =
            'SELECT InvoiceNumberBtoC, InvoiceNumberBtoB, InvoiceReturnNumberBtoC, InvoiceReturnNumberBtoB FROM dbo.AppentryNumber';
        log('qry ---$qry-----------------------------');
        String? qryrslt;
        try {
          log('000--------------------------');

          qryrslt = await connection.getData(qry);
          log('555---------------------------');
        } catch (e) {
          log(e.toString());
        }
        log('qryrslt ---$qryrslt-----------------------------');
// Decode the JSON string into a List of Maps
        List<dynamic> jsonData = jsonDecode(qryrslt!);

// Convert the JSON data into a list of InvoiceInfo objects
        List<InvoiceInfo> qryrsltdata =
            jsonData.map((json) => InvoiceInfo.fromJson(json)).toList();

        appentydataresult = qryrsltdata;
      } catch (e) {
        log(e.toString());
      }
    });
  }
}

List<String> extractPaymentMethods(String jsonString) {
  List<dynamic> parsedJson = json.decode(jsonString);
  List<String> paymentMethods = [];

  for (var item in parsedJson) {
    String paymentMethod = item['PaymentMethod'];
    paymentMethods.add(paymentMethod);
  }

  return paymentMethods;
}
