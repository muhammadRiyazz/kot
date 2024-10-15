part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  factory OrdersState({
    required bool isLoading,
    required    List<Order> tableOrders,
    required    List<Order> orders,
  }) = _OrdersState;
  factory OrdersState.initial() {
    return OrdersState(
      tableOrders: [],
      orders: [],
      isLoading: false,
    );
  }
}
