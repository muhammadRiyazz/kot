import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/presendation/printer%20ui/bill_print.dart';

part 'printing_event.dart';
part 'printing_state.dart';
part 'printing_bloc.freezed.dart';

class PrintingBloc extends Bloc<PrintingEvent, PrintingState> {
  PrintingBloc() : super(PrintingState.initial()) {
    on<PrintingEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, printed: false));

      try {
        log('print section ----------');

        PrinterConfig printer = event.printer;

        int printingStatus = 0;

        final List<int> test = await billPrintData(
          cGst: event.cGst,
          sGst: event.sGst,
          netAmount: event.netAmount,
          taxable: event.taxable,
          items: event.items,
          invoiceNo: event.invNo,
          tableNo: event.tableName,
        );

        printingStatus = await NetworkPrinter().printTicket(
          test,
          printer.printerName,
        );

        log('Printer response---$printingStatus');

        if (printingStatus == 1) {
          log('Printer status: 2---------');
          emit(state.copyWith(isLoading: false, printed: true));
        } else {
          log('Printer status: 1---------');
          emit(state.copyWith(
            printed: false,
            isLoading: false,
          ));
        }
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(isLoading: true, printed: false));
      }
    });
  }
}
