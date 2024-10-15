part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.allorders() = AllOrders;
    const factory OrdersEvent.tableOrders({required String tableNo}) = TableOrders;

}