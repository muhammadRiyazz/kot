import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_submit_print_event.dart';
part 'bill_submit_print_state.dart';
part 'bill_submit_print_bloc.freezed.dart';

class BillSubmitPrintBloc extends Bloc<BillSubmitPrintEvent, BillSubmitPrintState> {
  BillSubmitPrintBloc() : super( BillSubmitPrintState.initial()) {
    on<BillSubmitPrintEvent>((event, emit) {




      
    });
  }
}
