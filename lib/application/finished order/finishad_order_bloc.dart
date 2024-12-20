import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/invoice/inv_order_model.dart';

part 'finishad_order_event.dart';
part 'finishad_order_state.dart';
part 'finishad_order_bloc.freezed.dart';

class FinishadOrderBloc extends Bloc<FinishadOrderEvent, FinishadOrderState> {
  FinishadOrderBloc() : super(FinishadOrderState.initial()) {
    on<FetchBills>((event, emit) async {
      log('FetchBills called ---');
      try {
        emit(state.copyWith(
          isLoading: true,
        ));
        final now = DateTime.now();
        final dateOnly = DateFormat('yyyy-MM-dd').format(now);
        log(dateOnly);
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String query = """
  SELECT 
      [cusid],
      [cusname],
      [cusnameAddress],
      [custorcontact],
      [cusnameGSTNumber],
      [custominvno],
      [Invoicedate],
      [description],
      [totalamount],
      [totaltaxamount],
      [Discountamount],
      [TotalHavetoPayamount],
      [totalpaidamount],
      [balance],
      [CustomerTYPE],
      [CreditOrCleared],
      [INVtypeState],
      [TableNumber],
      [SubTotal],
      [BillDiscPER],
      [BillDiscTotal],
      [INVnetAmount],
      [INVtotalTAXAmnt],
      [TotalCessAmount],
      [ParcelOrNot],
      [BillAC],
      [OrderNumber],
      [UserID]
  FROM  [dbo].[InvoiceAccountDetail]
  WHERE CAST([Invoicedate] AS DATE) = '$dateOnly'
        AND [CreditOrCleared] = 'Cleared' AND [UserID] ='$usernameA';
""";

        String? result = await connection.getData(query);
        log(result);
        List<dynamic> jsonList = jsonDecode(result);
        List<InvoicesList> invoices =
            jsonList.map((e) => InvoicesList.fromJson(e)).toList();

        emit(state.copyWith(isLoading: false, invoices: invoices));
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
        ));
        log(e.toString());
      }
    });

    on<FetchDetails>((event, emit) async {
      log('FetchDetails called ---');
      try {
        emit(state.copyWith(
          isLoading: true,
        ));
        final now = DateTime.now();
        final dateOnly = DateFormat('yyyy-MM-dd').format(now);
        log(dateOnly);
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String query = """
  SELECT 
        [invoiceno]
      ,[invdate]
      ,[terms]
      ,[ordereference]
      ,[cusid]
      ,[invoiceto]
      ,[invaddress]
      ,[shipto]
      ,[shipaddr]
      ,[gstno]
      ,[email]
      ,[smsno]
      ,[CustomerTYPE]
      ,[pdtcode]
      ,[pdtname]
      ,[HSNCode]
      ,[discp ]
      ,[pcs]
      ,[qty]
      ,[Freeqty]
      ,[unitprice]
      ,[itemMRP]
      ,[Amount]
      ,[ItemDiscPer]
      ,[ItemDiscAmount]
      ,[GrossValueAftrITMDisc]
      ,[ItemBillDiscPER]
      ,[ItemBillDiscAmount]
      ,[ItemTotalNETAmount]
      ,[gst]
      ,[gstamount]
      ,[Totalamount]
      ,[venIGST]
      ,[venIGSTamnt]
      ,[venCGST]
      ,[venCGSTamnt]
      ,[venSGST]
      ,[venSGSTamnt]
      ,[CessPercentage]
      ,[CessAmount]
      ,[ItemUnitSaleRate]
      ,[ParcelOrNot]
      ,[OrderNumber]
      ,[KOTNumber]
      ,[UserID]
  FROM  [dbo].[invoicedetail]
  WHERE [invoiceno] = '${event.invNo}' ;
""";

        String? result = await connection.getData(query);
        log(result);
        List<dynamic> jsonData = jsonDecode(result);
        List<InvoiceItem> items =
            jsonData.map((item) => InvoiceItem.fromJson(item)).toList();
        emit(state.copyWith(isLoading: false, invoiceDetails: items));
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
        ));
        log(e.toString());
      }
    });
  }
}
