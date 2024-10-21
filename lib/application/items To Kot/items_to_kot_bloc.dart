import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_kot/domain/item/item_model.dart';

part 'items_to_kot_event.dart';
part 'items_to_kot_state.dart';
part 'items_to_kot_bloc.freezed.dart';

class ItemsToKotBloc extends Bloc<ItemsToKotEvent, ItemsToKotState> {
  ItemsToKotBloc() : super(ItemsToKotState.initial()) {
    on<itemsFromOrder>((event, emit) {
      try {
        // // Create a copy of the existing selectedItems list
        // List<OrderItem> selectedItems = List.from(state.selectedItems);

        // // Add all items from event.items to selectedItems
        // selectedItems.addAll(event.items);

        // // Emit the new state with the merged list
        emit(state.copyWith(selectedItems: event.items));
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
