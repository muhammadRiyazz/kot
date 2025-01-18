part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  factory OrdersState({
    required bool isLoading,
    required bool mergeisLoading,
        required int mergeStatus,

    required List<Order> tableOrders,
    required List<Order> orders,
    required List<Order> isSelected,
    required bool isMultiSelectMode,
    required int printerstatus,
  }) = _OrdersState;
  factory OrdersState.initial() {
    return OrdersState(
        mergeStatus: 0,
        mergeisLoading: false,
        tableOrders: [],
        orders: [],
        printerstatus: 0,
        isLoading: false,
        isMultiSelectMode: false,
        isSelected: []);
  }
}
