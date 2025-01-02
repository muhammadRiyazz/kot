part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.allorders() = AllOrders;
    const factory OrdersEvent.tableOrders({required String tableNo}) = TableOrders;
    const factory OrdersEvent.clearitem() = Clearitem;
        const factory OrdersEvent.longpress({required Order item}) = Longpress;
                const factory OrdersEvent.ontap({required Order item}) = Ontap;



}