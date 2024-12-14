import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';

part 'restore_bill_event.dart';
part 'restore_bill_state.dart';
part 'restore_bill_bloc.freezed.dart';

class RestoreBillBloc extends Bloc<RestoreBillEvent, RestoreBillState> {
  RestoreBillBloc() : super(RestoreBillState.initial()) {
    on<Restore>(_onRestoreEvent);
  }

  Future<void> _onRestoreEvent(
      Restore event, Emitter<RestoreBillState> emit) async {
    emit(state.copyWith(isLoading: true, updated: false));

    try {
      final MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
      final MssqlConnection connection =
          await connectionManager.getConnection();

      final String invQuery = """
        UPDATE [Restaurant].[dbo].[InvoiceAccountDetail]
        SET
          totalpaidamount = 0.00,
          balance = ${event.amt},
          CreditOrCleared = 'Credit'
        WHERE custominvno = '${event.invNo}';
      """;

      final String orderQuery = """
        UPDATE [Restaurant].[dbo].[OrderMainDetails]
        SET
          CreditOrPaid = 'Credit'
        WHERE OrderNumber = '${event.ordNo}';
      """;

      // Execute queries
      await connection.writeData(invQuery);
      await connection.writeData(orderQuery);

      emit(state.copyWith(isLoading: false, updated: true));
    } catch (error, stackTrace) {
      log('Error in RestoreBillBloc: $error',
          error: error, stackTrace: stackTrace);
      emit(state.copyWith(isLoading: false));
    }
  }
}
