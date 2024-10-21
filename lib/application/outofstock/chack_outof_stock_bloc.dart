import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chack_outof_stock_event.dart';
part 'chack_outof_stock_state.dart';
part 'chack_outof_stock_bloc.freezed.dart';

class ChackOutofStockBloc extends Bloc<ChackOutofStockEvent, ChackOutofStockState> {
  ChackOutofStockBloc() : super(_Initial()) {
    on<ChackOutofStockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
