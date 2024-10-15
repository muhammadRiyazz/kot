part of 'order_details_bloc.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
 factory OrderDetailsState({
    required bool isLoading,
    required      List<OrderItem> orderitems,
  }) = _OrderDetailsState;
  factory OrderDetailsState.initial() {
    return OrderDetailsState(
      orderitems: [],
      isLoading: false,
    );
  }}
