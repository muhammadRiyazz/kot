part of 'items_to_kot_bloc.dart';

@freezed
class ItemsToKotEvent with _$ItemsToKotEvent {
  const factory ItemsToKotEvent.itemsFromOrder({required List<OrderItem> items}) = itemsFromOrder;
  
}