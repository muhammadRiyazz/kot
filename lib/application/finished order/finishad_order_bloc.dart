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
      [UserID],
      [Merged]
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

    // Combined query
    String combinedQuery = """
    SELECT 
        inv.[invoiceno],
        inv.[invdate],
        inv.[terms],
        inv.[ordereference],
        inv.[cusid],
        inv.[invoiceto],
        inv.[invaddress],
        inv.[shipto],
        inv.[shipaddr],
        inv.[gstno],
        inv.[email],
        inv.[smsno],
        inv.[CustomerTYPE],
        inv.[pdtcode],
        inv.[pdtname],
        inv.[HSNCode],
        inv.[discp],
        inv.[pcs],
        inv.[qty],
        inv.[Freeqty],
        inv.[unitprice],
        inv.[itemMRP],
        inv.[Amount],
        inv.[ItemDiscPer],
        inv.[ItemDiscAmount],
        inv.[GrossValueAftrITMDisc],
        inv.[ItemBillDiscPER],
        inv.[ItemBillDiscAmount],
        inv.[ItemTotalNETAmount],
        inv.[gst],
        inv.[gstamount],
        inv.[Totalamount],
        inv.[venIGST],
        inv.[venIGSTamnt],
        inv.[venCGST],
        inv.[venCGSTamnt],
        inv.[venSGST],
        inv.[venSGSTamnt],
        inv.[CessPercentage],
        inv.[CessAmount],
        inv.[ItemUnitSaleRate],
        inv.[ParcelOrNot],
        inv.[OrderNumber],
        inv.[KOTNumber],
        inv.[UserID],
        pay.[paidby]
    FROM [dbo].[invoicedetail] inv
    LEFT JOIN [dbo].[PayorEX] pay
    ON inv.[invoiceno] = pay.[PayINVid]
    WHERE inv.[invoiceno] = '${event.invNo}';
    """;

    // Execute the combined query
    String? combinedResult = await connection.getData(combinedQuery);

    log('Combined Result: $combinedResult');

    // Parse results
    List<dynamic> jsonData = jsonDecode(combinedResult);
    List<InvoiceItem> invoiceDetails =
        jsonData.map((item) => InvoiceItem.fromJson(item)).toList();

    // Extract `paidby` field (assuming it is consistent across rows)
    String? paidBy = jsonData.isNotEmpty ? jsonData[0]['paidby'] : null;

    // Emit the state with the result
    emit(state.copyWith(
      isLoading: false,
      invoiceDetails: invoiceDetails,
      paidBy: paidBy,
    ));
  } catch (e) {
    emit(state.copyWith(
      isLoading: false,
    ));
    log(e.toString());
  }
});

  }
}
