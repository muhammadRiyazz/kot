part of 'order_details_bloc.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
 factory OrderDetailsState({
    required bool isLoading,
    required      List<OrderItem> orderitems,
        required      List<OrderItem> toAddItems,
                required      List<OrderItem> toCancelItems,


  }) = _OrderDetailsState;
  factory OrderDetailsState.initial() {
    return OrderDetailsState(
      orderitems: [],
      isLoading: false,toAddItems: [],toCancelItems: []
    );
  }}
