part of 'items_to_kot_bloc.dart';

@freezed
class ItemsToKotEvent with _$ItemsToKotEvent {
  const factory ItemsToKotEvent.itemsFromOrder({required List<Product> items}) = itemsFromOrder;
    const factory ItemsToKotEvent.add({
    required int qty,
    required Product product,
required bool isIncrement
  }) = Add;
}